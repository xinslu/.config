local fn = vim.fn
local api = vim.api
local lsp = vim.lsp
local M = {}

local custom_attach = function(client, bufnr)
    local opts = { silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    if client.server_capabilities.signature_help then
        vim.keymap.set("n", "<C-[>", vim.lsp.buf.signature_help, opts)
    end
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.format, opts)
    vim.keymap.set('n', '<space>fd', function() require("telescope.builtin").diagnostics({ bufnr = 0 }) end, opts)
    vim.keymap.set('n', '<space>wd', require("telescope.builtin").diagnostics, opts)
end

M.custom_attach = custom_attach

vim.diagnostic.config({
    underline = false,
    virtual_text = true,
    virtual_lines = false,
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        }
    }
})

return M
