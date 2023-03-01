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

    -- Status and Buffer Line
    'tamton-aquib/staline.nvim',

    -- Theme
    'nvim-tree/nvim-web-devicons',
    'sainnhe/sonokai',

    -- AutoCompletion {{{
    {
        "hrsh7th/nvim-cmp",
        dependencies = { { "L3MON4D3/LuaSnip", 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-cmdline', "hrsh7th/cmp-path", "saadparwaiz1/cmp_luasnip" } },
        config = function() require('lang.cmp') end,
        event = { "InsertEnter", "CmdlineEnter" },
    },
    { "hrsh7th/cmp-nvim-lsp", dependencies = "nvim-cmp", event = "LspAttach" },
    { "hrsh7th/cmp-nvim-lua", dependencies = "nvim-cmp", ft = "lua",         event = "InsertCharPre" },
    -- }}}

    -- lsp {{{
    { "neovim/nvim-lspconfig", config = function()
        require('lang.lsp')
    end,
        event = "BufAdd",
    },
    { "williamboman/mason.nvim",  config = true },
    { "onsails/lspkind-nvim",     event = "InsertCharPre" },
    { "ray-x/lsp_signature.nvim", event = "InsertCharPre" },
    -- }}}

    -- Git {{{
    ({ "rbong/vim-flog", dependencies = "tpope/vim-fugitive", cmd = { "Flog" } }),
    'airblade/vim-gitgutter',
    'akinsho/git-conflict.nvim',
    -- }}}

    -- Language Specific {{{
    { 'maxmellon/vim-jsx-pretty', ft = "javascriptreact" },
    { 'rust-lang/rust.vim',       ft = "rust" },
    { 'fatih/vim-go',             ft = "go" },
    { 'darrikonn/vim-gofmt',      ft = "go" },
    { 'lervag/vimtex',            ft = "tex" },
    { 'vimwiki/vimwiki',          ft = "vimwiki" },
    { 'wuelnerdotexe/vim-astro',  ft = "astro" },
    { 'folke/neodev.nvim',        config = true,         ft = "lua", event = "LspAttach" },
    { 'simrat39/rust-tools.nvim', config = function()
        local rt = require("rust-tools")
        rt.setup({
            server = {
                on_attach = configs.custom_attach,
                capabilities = configs.capabilities,
                single_file_support = true
            },
        })
    end, ft = "rust" },
    { 'p00f/clangd_extensions.nvim', config = function()
        require("clangd_extensions").setup({
            server = {
                on_attach = configs.custom_attach,
                capabilities = configs.capabilities,
                single_file_support = true
            }
        })
    end, ft = { "c", "cpp" } },
    -- }}}

    -- treesitter {{{
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function()
            require('lang.treesitter')
        end,
        event = "BufAdd",
    },
    -- }}}

    -- Better Workflow {{{
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
    },
    { 'terrortylor/nvim-comment',            event = "BufAdd" },
    { 'lukas-reineke/indent-blankline.nvim', event = "BufAdd" },
    { "gbprod/cutlass.nvim",                 event = "InsertCharPre" },
    -- }}}

})

-- vim:ts=4:sw=4:ai:foldmethod=marker:foldlevel=0:
