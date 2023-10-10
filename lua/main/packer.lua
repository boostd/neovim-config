-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope plugin
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.3',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Dracula theme
  use {
	  'maxmx03/dracula.nvim',
	  as = "dracula",
	  config = function()
		  local dracula = require 'dracula'
		  dracula.setup()
		  vim.cmd('colorscheme dracula')
	  end
  }

  -- Autosave
  use({
	  "Pocco81/auto-save.nvim",
	  config = function()
		  require("auto-save").setup {
		  }
	  end,
  })

  -- Treesitter
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- Harpoon
  -- Using a fork of the main plugin which provides truncation
  use {
    'ujkan/harpoon', branch = 'feature/truncate'
  }

  -- Undo tree
  use('mbbill/undotree')

  -- Git integration
  use('tpope/vim-fugitive')

  -- Auto-brackets
  use('m4xshen/autoclose.nvim')

  -- Java LSP setup
  use('mfussenegger/nvim-jdtls')

  -- LuaLine statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }


  -- LSP support
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},     -- Required
		  {'hrsh7th/cmp-nvim-lsp'}, -- Required
		  {'L3MON4D3/LuaSnip'},     -- Required
	  }
  }

end)

