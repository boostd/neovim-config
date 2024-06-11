-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Automatically install Packer on startup
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- LSP support
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip", run = "make install_jsregexp" }, -- Required
		},
	})

	-- Java LSP setup
	use("mfussenegger/nvim-jdtls")

	-- LSP status
	use({
		"j-hui/fidget.nvim",
		tag = "v1.1.0",
	})

	-- Formatting and linting by conform.nvim
	use({
		"stevearc/conform.nvim",
		requires = {
			{ "williamboman/mason.nvim" },
		},
	})

	-- Mason & confrom.nvim integration
	use({
		"zapling/mason-conform.nvim",
		requires = {
			{ "williamboman/mason.nvim" },
			{ "stevearc/conform.nvim" },
		},
	})

	-- Telescope plugin
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Dracula theme
	use({
		"maxmx03/dracula.nvim",
		as = "dracula",
	})

	-- Autosave
	use({
		"okuuva/auto-save.nvim",
		config = function()
			require("auto-save").setup({
				condition = function(buf)
					local fn = vim.fn

					-- don't save for special-buffers
					if fn.getbufvar(buf, "&buftype") ~= "" then
						return false
					end
					return true
				end,
			})
		end,
	})

	-- Treesitter
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	-- Harpoon
	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- Refactoring
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- Undo tree
	use("mbbill/undotree")

	-- Git integration
	use("tpope/vim-fugitive")

	-- Auto-brackets
	use({
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6", --recomended as each new version will have breaking changes
		config = function()
			require("ultimate-autopair").setup({
				extensions = {
					alpha = {
						p = 30,
						after = true,
						no_python = true,
					},
				},
			})
		end,
	})

	-- LuaLine statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- Fancy notifications
	use("rcarriga/nvim-notify")

	-- Leetcode exercises in nvim
	use({
		"kawre/leetcode.nvim",
		requires = { "MunifTanjim/nui.nvim" },
	})

	-- Monitor startup time
	use("dstein64/vim-startuptime")

	-- vim-illuminate
	use("RRethy/vim-illuminate")

	-- live renaming preview
	use({
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	})

	-- quick actions with surrounding
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({})
		end,
	})

	-- Flash.nvim
	use({ "folke/flash.nvim" })

	-- Automatically install plugins on first startup
	if packer_bootstrap then
		require("packer").sync()
	end
end)
