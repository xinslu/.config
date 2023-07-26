local exclude_fts={'NvimTree', 'help', 'dashboard', 'lir', 'alpha', '[Scratch]', '[No Name]', 'netrw'}

local function tabline_setup()
    local counter = 1
    local tabline = "%#Tabline#"
    for _, buf in pairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_is_loaded(buf) then
            local edited = vim.bo[buf].modified and " " or ""
            local f_name = vim.api.nvim_buf_get_name(buf):match("^.+[\\/](.+)$") or ""
            local current = vim.api.nvim_get_current_buf() == buf
            if (vim.tbl_contains(exclude_fts, vim.bo[buf].ft) or f_name == "") then
                goto next
            else
                f_name = " ".. f_name .." " end
            tabline = tabline.. "%#TabLine"..(current and "Sel" or "Inactive").."Count# " .. counter .. "%#TabLine"..(current and "Sel" or "Inactive").."#".. f_name .. edited
            counter = counter + 1
        end
        ::next::
    end
    return tabline.."%#TabLineFill#"
end

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufLeave', 'BufModifiedSet' }, {
    callback = function()
        vim.o.tabline = tabline_setup()
    end,
    pattern = '*',
})
