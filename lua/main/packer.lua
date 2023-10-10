-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Automatically install Packer on startup
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()




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

  -- Flash.nvim
  use {
    'folke/flash.nvim',
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
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



  -- Automatically install plugins on first startup
  if packer_bootstrap then
    require('packer').sync()
  end

end)

