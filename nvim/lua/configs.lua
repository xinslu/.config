-- {{{ Global Configs 
local set = vim.opt
local cmd = vim.cmd 
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
set.undofile = true
set.completeopt = 'menuone,noselect'
set.laststatus = 3
vim.lsp.set_log_level("debug")
--- }}}

-- imports {{{
require('configs.terminal')
require('nvim_comment').setup()
require('keymaps')
require("autocmd")
require("configs.treesitter");
-- }}}

-- Formatting {{{
cmd [[filetype on]]
-- }}}

-- Plugins {{{

-- vim-tex {{{
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_syntax_enabled = 1
vim.g.vimtex_syntax_conceal = 1
-- }}}

-- indent-blankline {{{
    vim.opt.list = true
    require("indent_blankline").setup {
        show_end_of_line = true,
    }
-- }}}

-- blankline {{{
    require("indent_blankline").setup {
        show_end_of_line = true,
        space_char_blankline = " ",
        show_current_context_start = true,
    }
-- }}}

--}}}

-- Highlights {{{
local cmd = vim.cmd -- execute Vim commands
vim.g.sonokai_diagnostic_virtual_text  = 'colored'
vim.g.sonokai_disable_terminal_colors = 1
cmd("set termguicolors")
cmd('colorscheme sonokai')
cmd("highlight Normal guibg=#0f0f0f")
cmd('highlight EndOfBuffer ctermfg=241 guifg=#0f0f0f guibg=#0f0f0f')
cmd('highlight Comment gui=italic')
-- }}}

-- vim:ts=4:sw=4:ai:foldmethod=marker:foldlevel=0:
