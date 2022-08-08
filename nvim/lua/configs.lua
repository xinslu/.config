local set = vim.opt -- global options
local cmd = vim.cmd -- execute Vim commands


vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
set.guicursor = ""
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.autoindent = true
set.cursorline = true
set.termguicolors = true
cmd('hi BufferInactiveMod guibg=#000000')
set.hidden = true
set.wrap = false
set.errorbells = true
set.incsearch = true
set.hlsearch = true
set.smartindent = true
set.scrolloff = 8
set.signcolumn = "yes:1"
set.mouse = 'a'
vim.g.mapleader = " "
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_improved_warnings = 1
vim.g.gruvbox_guisp_fallback = 'bg'
set.clipboard = "unnamedplus"
vim.g.yoinkIncludeDeleteOperations = 1
cmd('colorscheme gruvbox')
cmd("let g:gitgutter_override_sign_column_highlight=0")
cmd("highlight Normal guibg=#000000")
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
vim.cmd [[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]]
vim.cmd [[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js Prettier]]
require('nvim_comment').setup()
require('configs.terminal')
require('configs.trouble')
cmd('hi BufferTabpageFill guibg=#000000')
cmd('hi BufferInactive guibg=#000000')
cmd('hi BufferInactiveIndex guibg=#000000')
cmd('hi BufferInactiveMod guibg=#000000')
cmd('hi BufferInactiveSign guibg=#000000')
cmd('hi BufferCurrent guibg=#474646')
cmd('hi BufferCurrentMod guibg=#474646')
cmd('hi BufferCurrentSign guibg=#474646')
cmd('hi BufferCurrentIndex guibg=#474646')
cmd("let &t_SI = \"\\e[6 q\"")
cmd("let &t_EI .= \"\\e[6 q\"")
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<CR>', ':noh<CR><CR>', { noremap = true, silent = true })
vim.wo.number = true
vim.wo.relativenumber = true
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', '<C-W>k<C-W>l', { noremap = true, silent = true })
local group = vim.api.nvim_create_augroup("rc", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", { command = "setlocal nobuflisted", group = group })
vim.api.nvim_create_autocmd("InsertEnter", { command = ":let @/=\"\"" })
