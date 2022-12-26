vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim' use {
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
    use({ "neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require('configs.lsp')]] })
    use 'williamboman/nvim-lsp-installer'

    -- Git command inside vim
    use({ "tpope/vim-fugitive" })

    -- Better git log display
    use({ "rbong/vim-flog", requires = "tpope/vim-fugitive", cmd = { "Flog" } })


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
            require("trouble").setup {
                mode = "quickfix"
            }
        end
    }

    use {
        's1n7ax/nvim-terminal',
        config = [[require('configs.terminal')]]
    }
    use 'simrat39/rust-tools.nvim'
    use 'airblade/vim-gitgutter'
    use({ 'lervag/vimtex'
    })
    use { 'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("indent_blankline").setup {
                show_end_of_line = true,
                space_char_blankline = " ",
                show_current_context_start = true,
            }
        end
    }
    use 'sharkdp/fd'

    use { 'akinsho/git-conflict.nvim', config = function()
        require('git-conflict').setup()
    end }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'tpope/vim-surround'
    use({
        "gbprod/cutlass.nvim",
        config = function()
            require("cutlass").setup({
                cut_key = "m",
                override_del = nil,
                exclude = {},
            })
        end
    })
    use 'svermeulen/vim-yoink'
    use 'kyazdani42/nvim-web-devicons'
    use {
        "ray-x/lsp_signature.nvim",
    }
    use 'aktersnurra/no-clown-fiesta.nvim'
    use 'vimwiki/vimwiki'
    use 'jacoborus/tender.vim'
    use 'wuelnerdotexe/vim-astro'
end)
