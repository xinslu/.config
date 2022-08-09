vim.api.nvim_set_keymap("n", " xx", "<cmd>Trouble<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", " xw", "<cmd>Trouble workspace_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", " xd", "<cmd>Trouble document_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", " xl", "<cmd>Trouble loclist<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", " xq", "<cmd>Trouble quickfix<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
    { silent = true, noremap = true }
)
