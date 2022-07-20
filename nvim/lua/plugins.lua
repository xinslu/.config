vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {
        'kyazdani42/nvim-tree.lua',
        config = [[require('configs.nvim-tree')]]

    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = [[require('configs.lualine')]]
    }
    use {
        'romgrk/barbar.nvim',
        config = [[require('configs.barbar')]]
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = [[require('configs.telescope')]]
    }

    use 'gruvbox-community/gruvbox'
    use({
        "gelguy/wilder.nvim",
        requires = { { "romgrk/fzy-lua-native" } },
        setup = [[vim.cmd('packadd wilder.nvim')]],
        config = [[require('configs.wilder')]]
    })

    use({ "onsails/lspkind-nvim", event = "VimEnter" })
    -- auto-completion engine
    use {
        "hrsh7th/nvim-cmp",
        after = "lspkind-nvim",
        requires = { { "SirVer/ultisnips" } },
        config = [[require('configs.cmp')]]
    }

    -- nvim-cmp completion sources
    use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
    use { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" }
    use { "hrsh7th/cmp-path", after = "nvim-cmp" }
    use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
    use { "hrsh7th/cmp-omni", after = "nvim-cmp" }
    use { "quangnguyen30192/cmp-nvim-ultisnips", after = { 'nvim-cmp', 'ultisnips' } }
    use { "hrsh7th/cmp-emoji", after = 'nvim-cmp' }
    use({ "neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require('configs.lsp')]] })
    use 'williamboman/nvim-lsp-installer'

    -- Git command inside vim
    use({ "tpope/vim-fugitive" })

    -- Better git log display
    use({ "rbong/vim-flog", requires = "tpope/vim-fugitive", cmd = { "Flog" } })

    use({ "christoomey/vim-conflicted", requires = "tpope/vim-fugitive", cmd = { "Conflicted" } })

    -- Better git commit experience
    use({ "rhysd/committia.vim", opt = true, setup = [[vim.cmd('packadd committia.vim')]] })

    use 'terrortylor/nvim-comment'
    -- Highlighters
    use 'maxmellon/vim-jsx-pretty'
    use 'rust-lang/rust.vim'
    use 'prettier/vim-prettier'
    use 'fatih/vim-go'
    use 'darrikonn/vim-gofmt'

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
        end
    }

    use {
        's1n7ax/nvim-terminal',
        config = function()
            vim.o.hidden = true
            require('nvim-terminal').setup()
        end,
    }
    use 'simrat39/rust-tools.nvim'
    use 'airblade/vim-gitgutter'
    use({ 'lervag/vimtex'
    })
    use 'dag/vim-fish'
    use 'lukas-reineke/indent-blankline.nvim'
end)
