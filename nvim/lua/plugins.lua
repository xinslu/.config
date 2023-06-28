local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local configs = require("lang.lsp_configs")

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
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "L3MON4D3/LuaSnip", 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-cmdline', "hrsh7th/cmp-path",
                "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" } },
        config = function() require('lang.cmp') end,
        event = { "InsertEnter", "CmdlineEnter" },
    },
    { "hrsh7th/cmp-nvim-lsp", dependencies = "nvim-cmp", event = "LspAttach" },
    { "hrsh7th/cmp-nvim-lua", dependencies = "nvim-cmp", ft = "lua",         event = "InsertCharPre" },
    -- }}}

    -- lsp {{{
    {
        "neovim/nvim-lspconfig",
        config = function()
            require('lang.lsp')
        end,
        event = "BufEnter",
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
        -- dependencies = {'nvim-treesitter/playground'},
        build = ":TSUpdate",
        config = function()
            require('lang.treesitter')
        end,
        event = "BufAdd"
    },
    -- }}}

    -- Better Workflow {{{
    {"norcalli/nvim-colorizer.lua", setup = true},
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
