local set = vim.opt -- global options
local cmd = vim.cmd -- execute Vim commands
vim.g.mapleader = " "
vim.g.netrw_keepdir = 0
vim.g.netrw_banner = 0
vim.g.astro_typescript = 'enable'
set.termguicolors = true
require('configs.terminal')
require('nvim_comment').setup()
require('configs.trouble')
require('keymaps')
require("highlights")
local map = require("utils").map

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
  { noremap = true }
)
map("n", "<A-1>", ":BufferGoto 1<CR>", { silent = true })
map("n", "<A-2>", ":BufferGoto 2<CR>", { silent = true })
map("n", "<A-3>", ":BufferGoto 3<CR>", { silent = true })
map("n", "<A-4>", ":BufferGoto 4<CR>", { silent = true })
map("n", "<A-5>", ":BufferGoto 5<CR>", { silent = true })
map("n", "<A-6>", ":BufferGoto 6<CR>", { silent = true })
map("n", "<A-7>", ":BufferGoto 7<CR>", { silent = true })
map("n", "<A-8>", ":BufferGoto 8<CR>", { silent = true })
map("n", "<A-9>", ":BufferGoto 9<CR>", { silent = true })
map("n", "<A-s>", ":w<CR>", { silent = true })
map("n", "<A-w>", ":BufferClose<CR>", { silent = true })
map("n", "<A-q>", ":quitall<CR>", { silent = true })

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
set.undofile = true
set.completeopt = 'menuone,noselect'
set.laststatus = 3
