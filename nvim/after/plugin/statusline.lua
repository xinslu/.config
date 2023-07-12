local redirect = vim.fn.has('win32') == 1 and "nul" or "/dev/null"

local function update_branch()
    local cmd = io.popen('git branch --show-current 2>' .. redirect)
    local branch = ''
    if cmd ~= nil then
        branch = cmd:read("*l") or cmd:read("*a")
        cmd:close()
    end

    return branch ~= "" and "" .. branch or ""
end

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufLeave' }, {
    callback = function()
        vim.o.statusline = "%= %= " .. (update_branch()) .. " %l:%c"
    end,
    pattern = '*',
})
