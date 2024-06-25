local vimwiki = vim.api.nvim_create_augroup("vimwiki", { clear = false })
vim.api.nvim_create_autocmd("BufRead", {
    command = "set filetype=vimwiki",
    pattern = "*.wiki",
    group = vimwiki,
})
