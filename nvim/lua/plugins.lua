vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'

    -- Status and Buffer Line
    use 'tamton-aquib/staline.nvim'

    -- Theme
    use 'nvim-tree/nvim-web-devicons'
    use 'sainnhe/sonokai'

    -- AutoCompletion {{{
    use {
        "hrsh7th/nvim-cmp",
        after = "lspkind-nvim",
        requires = { { "L3MON4D3/LuaSnip" } },
        config = [[require('lang.cmp')]]
    }
    use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
    use { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" }
    use { "hrsh7th/cmp-path", after = "nvim-cmp" }
    use 'L3MON4D3/LuaSnip'
    use { "saadparwaiz1/cmp_luasnip", after = { 'nvim-cmp' } }
    use { 'hrsh7th/cmp-buffer', after = { 'nvim-cmp' } }
    use { 'hrsh7th/cmp-cmdline', after = { 'nvim-cmp' } }
    -- }}}

    -- lsp {{{
    use({ "neovim/nvim-lspconfig", config = [[require('lang.lsp')]] })
    use "williamboman/mason.nvim"
    use({ "onsails/lspkind-nvim", event = "VimEnter" })
    use "ray-x/lsp_signature.nvim"
    -- }}}

    -- Git {{{
    use({ "rbong/vim-flog", requires = "tpope/vim-fugitive", cmd = { "Flog" } })
    use 'airblade/vim-gitgutter'
    use 'akinsho/git-conflict.nvim'
    -- }}}

    -- Language Specific {{{
    use { 'maxmellon/vim-jsx-pretty', ft = "javascriptreact" }
    use { 'rust-lang/rust.vim', ft = "rust" }
    use { 'fatih/vim-go', ft = "go" }
    use { 'darrikonn/vim-gofmt', ft = "go" }
    use { 'simrat39/rust-tools.nvim' }
    use 'lervag/vimtex'
    use 'p00f/clangd_extensions.nvim'
    use 'vimwiki/vimwiki'
    use { 'wuelnerdotexe/vim-astro', ft="astro" }
    use 'folke/neodev.nvim'
    -- }}}

    -- treesitter {{{
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        config = [[require('lang.treesitter')]]
    }
    use 'nvim-treesitter/playground'
    -- }}}

-- Better Workflow {{{
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } },
    }
    use 'terrortylor/nvim-comment'
    use 'lukas-reineke/indent-blankline.nvim'
    use "gbprod/cutlass.nvim"
    -- }}}

end)
-- vim:ts=4:sw=4:ai:foldmethod=marker:foldlevel=0:
