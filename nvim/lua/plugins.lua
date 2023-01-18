vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'

    -- Status Line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = false},
    }

    -- Buffer Line
    use 'romgrk/barbar.nvim'

    -- Theme
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
    use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
    use { "hrsh7th/cmp-omni", after = "nvim-cmp" }
    use { "saadparwaiz1/cmp_luasnip", after = { 'nvim-cmp'} }
-- }}}

-- lsp {{{
    use({ "neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require('lang.lsp')]] })
    use 'williamboman/nvim-lsp-installer'
    use({ "onsails/lspkind-nvim", event = "VimEnter" })
    use "ray-x/lsp_signature.nvim"
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }
-- }}}

-- Git {{{
    use({ "rbong/vim-flog", requires = "tpope/vim-fugitive", cmd = { "Flog" } })
    use 'airblade/vim-gitgutter'
    use 'akinsho/git-conflict.nvim' 
-- }}}

-- Language Specific {{{
    use 'maxmellon/vim-jsx-pretty'
    use 'rust-lang/rust.vim'
    use 'prettier/vim-prettier'
    use 'fatih/vim-go'
    use 'darrikonn/vim-gofmt'
    use 'simrat39/rust-tools.nvim'
    use 'lervag/vimtex'
    use 'p00f/clangd_extensions.nvim'
    use 'vimwiki/vimwiki'
    use 'wuelnerdotexe/vim-astro'
-- }}}

-- treesitter {{{
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use { -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }
-- }}}

-- Better Workflow {{{
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } },
    }
    use 'terrortylor/nvim-comment'
    use 's1n7ax/nvim-terminal'
    use 'lukas-reineke/indent-blankline.nvim'
    use "gbprod/cutlass.nvim"
-- }}}

end)
-- vim:ts=4:sw=4:ai:foldmethod=marker:foldlevel=0:
