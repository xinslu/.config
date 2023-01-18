local group = vim.api.nvim_create_augroup("rc", { clear = false })
vim.api.nvim_create_autocmd("TermOpen",
    { command = "setlocal nonumber norelativenumber", group = group })

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

local ft = vim.api.nvim_create_augroup("netrw", { clear = false })
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.api.nvim_buf_set_keymap(0, "n", "l", "<CR>", { silent = true })
    end,
    pattern = "netrw",
    group = ft,
 })
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.api.nvim_buf_set_keymap(0, "n", "h", "-", { silent = true })
    end,
    pattern = "netrw",
    group = ft,
 })
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.api.nvim_buf_set_keymap(0, "n", "a", "%", { silent = true })
    end,
    pattern = "netrw",
    group = ft,
 })

local qf = vim.api.nvim_create_augroup("qf", { clear = false })
vim.api.nvim_create_autocmd("FileType", {
    command = "setlocal nobuflisted",
    pattern = "qf",
    group = qf,
 })
