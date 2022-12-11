local set = vim.opt -- global options
local cmd = vim.cmd -- execute Vim commands
vim.g.mapleader = " "
set.termguicolors = true
require('configs.terminal')
require('nvim_comment').setup()
require('configs.trouble')
require('keymaps')
require("highlights")

-- Formatting --
cmd [[filetype on]]
----

-- Autocmds --
local group = vim.api.nvim_create_augroup("rc", { clear = false })
vim.api.nvim_create_autocmd("TermOpen",
    { command = "setlocal nobuflisted nonumber norelativenumber", group = group })
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
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
set.laststatus = 3
