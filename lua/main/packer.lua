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
    config = function()
      local set_keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }

      set_keymap("n", "s", "<cmd>lua require('flash').jump()<cr>", opts)
      set_keymap("x", "s", "<cmd>lua require('flash').jump()<cr>", opts)
      set_keymap("o", "s", "<cmd>lua require('flash').jump()<cr>", opts)
      set_keymap("n", "S", "<cmd>lua require('flash').treesitter()<cr>", opts)
      set_keymap("x", "S", "<cmd>lua require('flash').treesitter()<cr>", opts)
      set_keymap("o", "S", "<cmd>lua require('flash').treesitter()<cr>", opts)
      set_keymap("o", "r", "<cmd>lua require('flash').remote()<cr>", opts)
      set_keymap("o", "R", "<cmd>lua require('flash').treesitter_search()<cr>", opts)
      set_keymap("x", "R", "<cmd>lua require('flash').treesitter_search()<cr>", opts)
      set_keymap("c", "<c-s>", "<cmd>lua require('flash').toggle()<cr>", opts)
    end,
  }

  use('dstein64/vim-startuptime')




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

