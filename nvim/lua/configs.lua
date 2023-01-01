local set = vim.opt -- global options
local cmd = vim.cmd -- execute Vim commands

-- Global Configs --
vim.g.mapleader = " "
vim.g.netrw_keepdir = 0
vim.g.netrw_banner = 0
vim.g.astro_typescript = 'enable'
vim.g.netrw_liststyle = 3
set.termguicolors = true
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
set.ignorecase = true
set.smartcase = true
set.completeopt = 'menu,noselect'
vim.g.yoinkIncludeDeleteOperations = 1
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"
set.undofile = true
set.completeopt = 'menuone,noselect'
set.laststatus = 3
---

-- imports --
local map = require("utils").map
require('configs.terminal')
require('nvim_comment').setup()
require('configs.trouble')
require('keymaps')
require("highlights")
require("configs.treesitter");
--

-- Formatting --
cmd [[filetype on]]
----

-- Autocmds --
local group = vim.api.nvim_create_augroup("rc", { clear = false })
vim.api.nvim_create_autocmd("TermOpen",
    { command = "setlocal nobuflisted nonumber norelativenumber", group = group })
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
vim.api.nvim_set_keymap(
    "n",
    "<space>fe",
    ":Explore\n",
    { noremap = true, silent = true}
)
map("n", "<A-s>", ":w<CR>", { silent = true })
map("n", "<A-q>", ":quitall<CR>", { silent = true })
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
----


