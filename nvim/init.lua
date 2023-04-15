local set = vim.opt
local cmd = vim.cmd
local map = require("utils").map
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
vim.g.yoinkIncludeDeleteOperations = 1
vim.wo.number = true
vim.opt.list = true
set.undofile = true
set.completeopt = 'menuone,noselect'
set.laststatus = 3
vim.g.wildmenu = true
vim.g.wildignorecase = true
vim.o.showcmd = false
vim.g.wildmode = "list:longest,full"
vim.o.hidden = true
vim.opt.fillchars:append("eob: ")
vim.g.python3_host_prog = "python3"
vim.opt.showtabline = 2
--- }}}

-- Formatting {{{
vim.cmd("filetype on")
-- }}}

-- Keymaps {{{
-- Key remaps {{{
map('n', '<C-j>', '<C-W>j')
map('n', '<C-k>', '<C-W>k')
map('n', '<C-l>', '<C-W>l')
map('n', '<C-h>', '<C-W>h')
map('t', '<Esc>', '<C-\\><C-n>')
map("n", "E", "ea")
map("n", "<A-s>", cmd.w)
map("n", "<A-q>", cmd.q)
map("n", "<A-w>", cmd.bd)
map("n", "<A-Q>", "<cmd>q!<cr>")
map("n", "<A-e>", cmd.quitall)
map('n', '<CR>', cmd.noh)
map('n', '<space>t', "<cmd>botright 7split | terminal<cr>")
map('n', '<space>=', "<cmd>horizontal resize +5<cr>")
map('n', '<space>-', "<cmd>horizontal resize -5<cr>")
-- }}}

require("plugins")

-- Function Keybinds {{{
for i = 1, 9 do
    map("n", "<A-" .. i .. ">", function() changeBuffer(i) end)
end
map('n', '<C-s>', require('telescope.builtin').find_files)
map('n', 'gr', require('telescope.builtin').lsp_references)
map('n', '<C-b>', require("utils").openTerm)
map('n', '<C-f>',
    function()
        require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ') })
    end)

map('n', '<C-g>',
    function()
        require('telescope.builtin').git_commits()
    end)
map("n", "<space>fe",cmd.Explore)
map("n", "<leader>u", require "telescope".extensions.undo.undo)
-- }}}
-- }}}

-- Highlights {{{
vim.g.sonokai_diagnostic_virtual_text = 'colored'
vim.g.sonokai_disable_terminal_colors = 1
vim.g.sonokai_enable_italic = 1
vim.g.sonokai_better_performance = 1
vim.cmd.colorscheme("sonokai")
vim.api.nvim_set_hl(0, "Normal", { bg = "#0f0f0f" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0f0f0f"})
vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0f0f0f" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "BufferCurrent", { bg = "#0f0f0f" })
vim.api.nvim_set_hl(0, "BufferCurrentIndex", { bg = "#0f0f0f" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "#0f0f0f", fg = "#0f0f0f" })
vim.api.nvim_set_hl(0, "BufferCurrentMod", { bg = "#0f0f0f" })
vim.api.nvim_set_hl(0, "BufferCurrentSign", { bg = "#0f0f0f" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "#0f0f0f" })

-- Telescope {{{
local TelescopePrompt = {
    TelescopePromptNormal = {
        bg = '#2c2e34',
    },
    TelescopeSelection = {
        bg = '#2c2e34',
    },
    TelescopePromptBorder = {
        bg = '#2c2e34',
        fg = '#2c2e34',
    },
    TelescopeBorder = {
        bg = '#0f0f0f',
        fg = '#0f0f0f',
    },
    TelescopePromptTitle = {
        fg = '#0f0f0f',
        bg = '#f39660',
    },
    TelescopePreviewTitle = {
        fg = '#0f0f0f',
        bg = '#76cce0',
    },
    TelescopeResultsTitle = {
        fg = '#0f0f0f',
        bg = '#fc5d7c',
    },
}
for hl, col in pairs(TelescopePrompt) do
    vim.api.nvim_set_hl(0, hl, col)
end
-- }}}
-- }}}

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
    pattern = {"javascript", "javascriptreact"},
})
-- }}}

-- Plugins {{{

-- vim-tex {{{
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

-- staline {{{
require "staline".setup {
    sections = {
        left = {},
        mid = {},
        right = { 'branch', ' ', 'line_column' }
    },
    defaults = {
        line_column = "%l:%c",
        fg = "#7f8490",
        true_colors = true,
        branch_symbol = " "
    }
}
-- }}}

-- stabline {{{
require('stabline').setup {
    stab_bg = "#222327",
    stab_left = " ",
    exclude_fts = { 'netrw', 'dashboard', 'lir', 'terminal' },
    font_active = "none",
    numbers = function(bufn, n)
        return n .. ' '
    end
}
-- }}}

-- indent-blankline {{{
require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = false,
}
-- }}}

-- }}}

-- vim:ts=4:sw=4:ai:foldmethod=marker:foldlevel=0:
