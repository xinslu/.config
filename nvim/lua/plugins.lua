local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local configs = require("lang.lsp_configs")
local cong


if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    -- AutoCompletion {{{
    {
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',
        version = 'v0.*',
        opts = {
            keymap = { preset = 'default' },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
        },
        opts_extend = { "sources.default" }
    },
    -- }}}

    -- lsp {{{
    {
        "neovim/nvim-lspconfig",
        dependencies = { 'saghen/blink.cmp' },
        config = function()
            require('lang.lsp')
        end,
        event =  { "BufReadPost", "BufNewFile", "ColorScheme" },
    },
    { "williamboman/mason.nvim",  config = true },
    -- }}}

    -- Language Specific {{{
    { 'lervag/vimtex',             ft = "tex" },
    { 'vimwiki/vimwiki',           ft = "vimwiki" },
    { 'wuelnerdotexe/vim-astro',   ft = "astro" },
    {
        'simrat39/rust-tools.nvim',
        config = function()
            local rt = require("rust-tools")
            rt.setup({
                server = {
                    on_attach = configs.custom_attach,
                    capabilities = configs.capabilities,
                    single_file_support = true
                },
            })
        end,
        ft = "rust"
    },
    {
        'p00f/clangd_extensions.nvim',
        config = function()
            require("clangd_extensions").setup({
                server = {
                    on_attach = configs.custom_attach,
                    capabilities = configs.capabilities,
                    single_file_support = true
                }
            })
        end,
        ft = { "c", "cpp" }
    },
    -- }}}

    -- treesitter {{{
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('lang.treesitter')
        end,
    },
    -- }}}

    -- Better Workflow {{{
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            { 'nvim-lua/plenary.nvim', 'debugloop/telescope-undo.nvim' } },
        config = function()
            require("telescope").setup({
                defaults = {
                    prompt_prefix = "   ",
                    selection_caret = "   ",
                    entry_prefix = "    ",
                    initial_mode = "normal",
                },
            })
            require("telescope").load_extension("undo")
        end,
    },
    {
        'terrortylor/nvim-comment',
        config = function()
            require('nvim_comment').setup({ comment_empty = false })
        end
    },
    { 'lukas-reineke/indent-blankline.nvim', event = "BufAdd" },
-- }}}

})

-- vim:ts=4:sw=4:ai:foldmethod=marker:foldlevel=0:
