local exclude_fts={'NvimTree', 'help', 'dashboard', 'lir', 'alpha', '[Scratch]', '[No Name]'}

local function tabline_setup()
    local counter = 1
    local tabline = "%#Tabline#"
    for _, buf in pairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_is_loaded(buf) then
            local f_name = vim.api.nvim_buf_get_name(buf):match("^.+[\\/](.+)$") or ""
            if (vim.tbl_contains(exclude_fts, vim.bo[buf].ft) or f_name == "") then
                goto next
            else
                f_name = " ".. f_name .." " end
            tabline = tabline.. "%#Tabline"..((vim.api.nvim_get_current_buf() == buf) and "Sel" or "Inactive").."# " .. counter .. f_name
            counter = counter + 1
        end
        ::next::
    end
    return tabline.."%#Stabline#%=".. ""
end

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufLeave' }, {
    callback = function()
        vim.o.tabline = tabline_setup()
    end,
    pattern = '*',
})
