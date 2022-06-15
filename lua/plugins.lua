vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'wojciechkepka/vim-github-dark'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- For file icon
    },
  }
  use {
    'nvim-lualine/lualine.nvim',
     requires = { 'kyazdani42/nvim-web-devicons', opt = true },
     config = [[require('configs.nvim-tree')]]
  }
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = [[require('configs.barbar')]]
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = [[require('configs.telescope')]]
  }

  use 'morhetz/gruvbox'

  use({"gelguy/wilder.nvim", opt = true, setup = [[vim.cmd('packadd wilder.nvim')]]})
end)
