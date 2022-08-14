local M = {}
function M.openTerm()
    local file = vim.fn.expand('%:p')
    local extension = vim.bo.filetype
    local cmd = "terminal"
    if vim.bo.filetype == 'lua' then
        cmd = cmd .. " echo lua " .. file
    end
    if vim.bo.filetype == 'python' then
        cmd = cmd .. " python " .. file
    end
    if vim.bo.filetype == 'rust' then
        cmd = cmd .. " rustc " .. file
    end
    require('nvim-terminal').DefaultTerminal:open(5)
    vim.cmd(cmd)
end

return M
