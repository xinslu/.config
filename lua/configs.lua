local exec = vim.api.nvim_exec -- execute Vimscript
local set = vim.opt -- global options
local cmd = vim.cmd -- execute Vim commands

set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
vim.opt.autoindent = true
vim.opt.cursorline = true
set.termguicolors = false
set.hlsearch = false
set.hidden = true
set.wrap = false
set.errorbells = true
set.incsearch = true
set.scrolloff = 8
set.signcolumn = "yes"
vim.g.mapleader = " "
vim.g.gruvbox_italic = 1
vim.g.gruvbox_contrast_dark = "hard"
vim.g["gruvbox_colors"] = { bg0 = {'#000000', 0} }
cmd('colorscheme gruvbox')
cmd("highlight Normal ctermbg=0")
-- cmd("set notermguicolors")
require('lualine').setup()
-- require('configs.nvim-tree')
cmd("let &t_SI = \"\\e[6 q\"")
cmd("let &t_EI .= \"\\e[6 q\"")
vim.wo.number = true
