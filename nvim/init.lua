local set = vim.opt
local cmd = vim.cmd
local utils = require("utils")
local changeBuffer = require("utils").changeBuffer

-- {{{ Global Configs
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
set.conceallevel = 2
set.mouse = 'a'
set.clipboard = "unnamedplus"
set.ignorecase = true
set.smartcase = true
set.completeopt = 'menu,noselect'
vim.wo.number = true
vim.opt.list = true
set.undofile = true
set.laststatus = 3
vim.opt.wildmenu = true
vim.opt.wildignorecase = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildoptions = "pum,fuzzy"
vim.opt.listchars:append("tab:│ ")
vim.opt.listchars:append("leadmultispace:│   ")
vim.g.python3_host_prog = "python3"
vim.opt.showtabline = 2
--- }}}

-- Formatting {{{
vim.cmd("filetype on")
-- }}}

-- Keymaps {{{
-- Key remaps {{{
utils.map('n', '<C-j>', '<C-W>j')
utils.map('n', '<C-k>', '<C-W>k')
utils.map('n', '<C-l>', '<C-W>l')
utils.map('n', '<C-h>', '<C-W>h')
utils.map('t', '<Esc>', '<C-\\><C-n>')
utils.map("n", "E", "ea")
utils.map("n", "<A-s>", cmd.w)
utils.map("n", "<A-q>", cmd.q)
utils.map("n", "<A-w>", cmd.bd)
utils.map("n", "<A-Q>", "<cmd>q!<cr>")
utils.map("n", "<A-e>", cmd.quitall)
utils.map('n', '<CR>', cmd.noh)
utils.map('n', '<space>t', "<cmd>botright 7split | terminal<cr>")
utils.map('n', '<space>=', "<cmd>horizontal resize +5<cr>")
utils.map('n', '<space>-', "<cmd>horizontal resize -5<cr>")
utils.map({ 'x', 'n', 'v' }, 's', "m")
utils.map({ 'x', 'n', 'v' }, 'm', "d")
utils.map('n', 'mm', "dd")
utils.map({ 'x', 'n', 'v' }, 'd', "\"_d")
utils.map({ 'x', 'n', 'v' }, 'c', "\"_c")
-- }}}

require("plugins")

-- Function Keybinds {{{
for i = 1, 9 do
    utils.map("n", "<A-" .. i .. ">", function() changeBuffer(i) end)
end
utils.map('n', '<C-s>', require('telescope.builtin').find_files)
utils.map('n', 'gr', require('telescope.builtin').lsp_references)
utils.map('n', '<C-b>', require("utils").openTerm)
utils.map('n', '<C-f>',
    function()
        require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ') })
    end)

utils.map('n', '<C-g>',
    function()
        require('telescope.builtin').git_commits()
    end)
utils.map("n", "<space>fe", cmd.Explore)
utils.map("n", "<leader>u", require "telescope".extensions.undo.undo)
-- }}}
-- }}}
--
vim.cmd.colorscheme("graphite")

-- Autocmds {{{
local group = vim.api.nvim_create_augroup("rc", { clear = false })
vim.api.nvim_create_autocmd("TermOpen",
    { command = "set nobuflisted bufhidden=hide nonumber norelativenumber", group = group })

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

local qf = vim.api.nvim_create_augroup("qf", { clear = false })
vim.api.nvim_create_autocmd("FileType", {
    command = "setlocal nobuflisted",
    pattern = "qf",
    group = qf,
})
local ft = vim.api.nvim_create_augroup("netrw", { clear = false })
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.api.nvim_buf_set_keymap(0, "n", "l", "<CR>", { silent = true })
        vim.api.nvim_buf_set_keymap(0, "n", "h", "-", { silent = true })
        vim.api.nvim_buf_set_keymap(0, "n", "a", "%", { silent = true })
    end,
    pattern = "netrw",
    group = ft,
})

vim.api.nvim_create_autocmd("FileType", {
    command = "setlocal formatprg=prettier\\ --single-quote\\ --trailing-comma\\ es5\\ --parser\\ flow",
    pattern = { "javascript", "javascriptreact" },
})
-- }}}

-- Plugins {{{

-- vim-tex {{{
vim.g.vimtex_compiler_enabled = false
vim.g.tex_fast = "bMpr"
vim.g.tex_conceal = ""
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_syntax_enabled = 1
vim.g.vimtex_quickfix_enabled = 0
vim.g.vimtex_matchparen_enabled = 0
vim.g.vimtex_indent_enabled = 0
vim.g.vimtex_complete_enable = 0
vim.g.vimtex_indent_bib_enabled = 0
-- }}}

-- }}}


-- vim:ts=4:sw=4:ai:foldmethod=marker:foldlevel=0:
