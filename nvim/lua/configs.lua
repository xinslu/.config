local set = vim.opt -- global options
local cmd = vim.cmd -- execute Vim commands
vim.g.mapleader = " "
require('configs.terminal')
require('nvim_comment').setup()
require('configs.trouble')

-- Colors --
vim.g.gruvbox_improved_warnings = 1
set.termguicolors = true
vim.g.gruvbox_contrast_hard = 'hard'
cmd('colorscheme gruvbox')
cmd("highlight Directory gui=bold guifg=#677FA3")
cmd("highlight NvimTreeOpenedFolderName gui=bold")
cmd("highlight NvimTreeNormal guibg=#3c3836")
cmd("highlight NvimTreeSignColumn guibg=#3c3836")
cmd("highlight Normal guibg=#212121")
cmd('highlight clear SignColumn')
cmd('highlight GitGutterAdd guibg=#212121 guifg=#009900')
cmd('highlight GitGutterChange guibg=#212121 guifg=#bbbb00')
cmd('highlight GitGutterDelete guibg=#212121 guifg=#ff2222')
cmd('highlight GruvboxRedSign ctermfg=167 ctermbg=237 guifg=#fb4934 guibg=#212121')
cmd('highlight GruvboxYellowSign ctermfg=214 ctermbg=237 guifg=#fabd2f guibg=#212121')
cmd('highlight GruvboxBlueSign ctermfg=109 ctermbg=237 guifg=#83a598 guibg=#212121')
cmd('highlight GruvboxAquaSign ctermfg=108 ctermbg=237 guifg=#8ec07c guibg=#212121')
cmd('highlight GruvboxBg3 ctermfg=108 guibg=#212121 guifg=#212121')
cmd('highlight VertSplit ctermfg=241 ctermbg=235 guifg=#212121 guibg=#212121')
cmd('highlight EndOfBuffer ctermfg=bg guifg=#3c3836')
----

-- Formatting --
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
vim.cmd [[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]]
vim.cmd [[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js Prettier]]
----

-- Keymaps --
-- vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<CR>', ':noh<CR><CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', '<C-W>k<C-W>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-b>', ':lua require"configs.build".openTerm()<CR>', { noremap = true })
----

-- Autocmds --
local group = vim.api.nvim_create_augroup("rc", { clear = true })
vim.api.nvim_create_autocmd("TermOpen",
    { command = "setlocal nobuflisted nonumber norelativenumber", group = group })
vim.api.nvim_create_autocmd("InsertEnter", { command = ":let @/=\"\"" })
----



set.guicursor = ""
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.autoindent = true
set.cursorline = true
set.hidden = true
set.wrap = false
set.errorbells = false
set.incsearch = true
set.hlsearch = true
set.smartindent = true
set.scrolloff = 8
set.signcolumn = "yes:1"
set.mouse = 'a'
set.clipboard = "unnamedplus"
vim.g.yoinkIncludeDeleteOperations = 1
vim.wo.number = true
vim.wo.relativenumber = true
cmd('highlight NvimTreeStatusLineNC guibg=#212121 guifg=#212121')
cmd('highlight NvimTreeStatusLine guibg=#212121 guifg=#212121 gui=bold')
set.laststatus = 3
