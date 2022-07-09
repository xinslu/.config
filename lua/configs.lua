local exec = vim.api.nvim_exec -- execute Vimscript
local set = vim.opt -- global options
local cmd = vim.cmd -- execute Vim commands


vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.autoindent = true
set.cursorline = false
set.termguicolors = true
set.hidden = true
set.wrap = false
set.errorbells = true
set.incsearch = true
set.scrolloff = 8
set.signcolumn = "yes:1"
vim.g.mapleader = " "
vim.g.gruvbox_italic = 1
vim.g.gruvbox_contrast_dark = "hard"
vim.g["gruvbox_colors"] = { bg0 = { '#000000' } }
vim.g["gruvbox_sign_column"] = "bg1"
set.clipboard = "unnamedplus"
cmd("let g:gitgutter_override_sign_column_highlight=1")
cmd('colorscheme gruvbox')
cmd("highlight Normal guibg=#000000")
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
vim.cmd [[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]]
-- cmd("set notermguicolors")
vim.cmd [[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js Prettier]]
require('nvim_comment').setup()
require('configs.terminal')
require('configs.trouble')
cmd("let &t_SI = \"\\e[6 q\"")
cmd("let &t_EI .= \"\\e[6 q\"")
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '\'', '\'\'<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '\"', '\"\"<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<CR>', ':noh<CR><CR>', { noremap = true, silent = true })
vim.wo.number = true
vim.wo.relativenumber = true
