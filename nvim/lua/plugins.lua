local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

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
        dependencies = { { "L3MON4D3/LuaSnip" } },
        config = function() require('lang.cmp') end,
        event = { "InsertEnter", "CmdlineEnter" },
    },
     { "hrsh7th/cmp-nvim-lsp", dependencies = "nvim-cmp", event = "LspAttach" },
     { "hrsh7th/cmp-nvim-lua", dependencies = "nvim-cmp", ft = "lua" },
     { "hrsh7th/cmp-path", dependencies = "nvim-cmp", event = "InsertCharPre" },
     { 'L3MON4D3/LuaSnip', dependencies = "nvim-cmp", event = "InsertCharPre" },
     { "saadparwaiz1/cmp_luasnip", dependencies = { 'nvim-cmp' }, event = "InsertCharPre"},
     { 'hrsh7th/cmp-buffer', dependencies = { 'nvim-cmp' }, event = "InsertCharPre" },
     { 'hrsh7th/cmp-cmdline', dependencies = { 'nvim-cmp' }, event = "CmdlineEnter" },
    -- }}}

    -- lsp {{{
    { "neovim/nvim-lspconfig", config = function() 
		require('lang.lsp') 
	end, 
	},
     "williamboman/mason.nvim",
    { "onsails/lspkind-nvim", event = "VimEnter" },
     "ray-x/lsp_signature.nvim",
    -- }}}

    -- Git {{{
    ({ "rbong/vim-flog", dependencies = "tpope/vim-fugitive", cmd = { "Flog" } }),
     'airblade/vim-gitgutter',
     'akinsho/git-conflict.nvim',
    -- }}}

    -- Language Specific {{{
     { 'maxmellon/vim-jsx-pretty', ft = "javascriptreact" },
     { 'rust-lang/rust.vim', ft = "rust" },
     { 'fatih/vim-go', ft = "go" },
     { 'darrikonn/vim-gofmt', ft = "go" },
     { 'simrat39/rust-tools.nvim' },
     { 'lervag/vimtex', ft = "tex" },
     { 'p00f/clangd_extensions.nvim', ft = {"c", "cpp"} },
     'vimwiki/vimwiki',
     { 'wuelnerdotexe/vim-astro', ft="astro" },
     {'folke/neodev.nvim', ft="lua" },
    -- }}}

    -- treesitter {{{
     {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function() 
            require('lang.treesitter')
        end,
    },
    -- }}}

-- Better Workflow {{{
     {
        'nvim-telescope/telescope.nvim',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
    },
     'terrortylor/nvim-comment',
     'lukas-reineke/indent-blankline.nvim',
     "gbprod/cutlass.nvim",
    -- }}}

})

-- vim:ts=4:sw=4:ai:foldmethod=marker:foldlevel=0:
