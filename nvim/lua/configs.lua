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
vim.g.wildmenu = true
vim.g.wildignorecase = true
vim.g.wildmode = "list:longest,full"
vim.o.hidden = true
vim.opt.fillchars:append("eob: ")
vim.lsp.set_log_level("debug")
--- }}}

-- Formatting {{{
vim.cmd("filetype on")
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

-- nvim-terminal {{{
require('nvim-terminal').setup({
    window = {
        position = 'botright',
        split = 'sp',
        height = 8,
    },
    toggle_keymap = '<leader>t',
    increase_height_keymap = '<leader>=',
    decrease_height_keymap = '<leader>-',
})
--}}}

-- lualine {{{
require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "sonokai",
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = {"filename"},
        lualine_x = { "filetype"},
        lualine_y = { "progress" },
        lualine_z = {
            "location",
            {
                "diagnostics",
                sources = { "nvim_diagnostic" }
            },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = { 'quickfix', 'fugitive' },
})
-- }}}

-- nvim-comment {{{
    require('nvim_comment').setup()
-- }}}

-- barbar {{{
require 'bufferline'.setup {
    icons = 'both',
    icon_separator_inactive = '',
    icon_close_tab_modified = '●',
    no_name_title = "unnamed",
}
-- }}}

-- Trouble {{{
require("trouble").setup {
    mode = "quickfix"
}
-- }}}

-- indent-blankline {{{
require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
-- }}}

-- cutlass {{{
require("cutlass").setup({
    cut_key = "m",
    override_del = nil,
    exclude = {},
})
-- }}}

-- git-conflict {{{
require('git-conflict').setup()
-- }}}

-- }}}

-- Highlights {{{
local cmd = vim.cmd -- execute Vim commands
vim.g.sonokai_diagnostic_virtual_text  = 'colored'
vim.g.sonokai_disable_terminal_colors = 1
vim.g.sonokai_show_eob = 1
vim.cmd.colorscheme("sonokai")
vim.api.nvim_set_hl(0, "Normal", { bg = "#0f0f0f" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "Comment", {default = true, italic = true})
-- }}}

-- Autocmds {{{
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
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.api.nvim_buf_set_keymap(0, "n", "a", "%", { silent = true })
    end,
    pattern = "netrw",
    group = ft,
 })

local qf = vim.api.nvim_create_augroup("qf", { clear = false })
vim.api.nvim_create_autocmd("FileType", {
    command = "setlocal nobuflisted",
    pattern = "qf",
    group = qf,
 })
-- }}}

-- Keymaps {{{
local map = require("utils").map

map('n', '<CR>', ':noh<CR><CR>')
map('n', '<C-j>', '<C-W>j')
map('n', '<C-k>', '<C-W>k')
map('n', '<C-l>', '<C-W>l')
map('n', '<C-h>', '<C-W>h')
map('t', '<Esc>', '<C-\\><C-n>')
map("n", "<space>fe", ":Explore\n")
map("n", "<A-s>", ":w<CR>")
map("n", "E", "ea")
map("n", "<A-q>", ":quitall<CR>")
map('n', '<A-,>', ':BufferPrevious<CR>')
map('n', '<A-.>', ':BufferNext<CR>')
map('n', '<A-<>', ':BufferMovePrevious<CR>')
map('n', '<A->>', ' :BufferMoveNext<CR>')
map("n", "<A-1>", ":BufferGoto 1<CR>")
map("n", "<A-2>", ":BufferGoto 2<CR>")
map("n", "<A-3>", ":BufferGoto 3<CR>")
map("n", "<A-4>", ":BufferGoto 4<CR>")
map("n", "<A-5>", ":BufferGoto 5<CR>")
map("n", "<A-6>", ":BufferGoto 6<CR>")
map("n", "<A-7>", ":BufferGoto 7<CR>")
map("n", "<A-8>", ":BufferGoto 8<CR>")
map("n", "<A-9>", ":BufferGoto 9<CR>")
map('n', '<A-0>', ':BufferLast<CR>')
map('n', '<A-p>', ':BufferPin<CR>')
map("n", "<A-w>", ":BufferClose<CR>")
map('n', '<C-p>', ':BufferPick<CR>')
map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>')
map('n', '<Space>bd', ':BufferOrderByDirectory<CR>')
map('n', '<Space>bl', ':BufferOrderByLanguage<CR>')
map('n', '<Space>bw', ':BufferOrderByWindowNumber<CR>')
map("n", " xx", "<cmd>Trouble<cr>")
map("n", " xw", "<cmd>Trouble workspace_diagnostics<cr>")
map("n", " xd", "<cmd>Trouble document_diagnostics<cr>")
map("n", " xl", "<cmd>Trouble loclist<cr>")
map("n", " xq", "<cmd>Trouble quickfix<cr>")
map("n", "gR", "<cmd>Trouble lsp_references<cr>")

vim.keymap.set('n', '<C-f>',
    function()
        require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})
    end, 
    { noremap = true, desc = "Project Wide search" })
vim.keymap.set('n', '<C-s>', 
    function()
        require('telescope.builtin').find_files()
    end,
    { noremap = true, desc = "Project Wide File search" })
vim.keymap.set('n', 'gr', 
    function()
        require('telescope.builtin').lsp_references()
    end,
    { noremap = true, desc = "Project Wide File search" })

vim.keymap.set('n', '<C-b>', 
    function()
        require("utils").openTerm()
    end,
    { noremap = true, desc = "Build System" })

-- }}}

-- vim:ts=4:sw=4:ai:foldmethod=marker:foldlevel=0:
