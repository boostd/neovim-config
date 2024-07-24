local slow_format_filetypes = {}

require("conform").formatters.prettier = {
	options = {
		ft_parsers = {
			vue = "vue",
		},
	},
}

require("conform").setup({
	format_on_save = function(bufnr)
		if slow_format_filetypes[vim.bo[bufnr].filetype] then
			return
		end
		local function on_format(err)
			if err and err:match("timeout$") then
				slow_format_filetypes[vim.bo[bufnr].filetype] = true
			end
		end

		return { timeout_ms = 500, lsp_fallback = "never" }, on_format
	end,

	format_after_save = function(bufnr)
		if not slow_format_filetypes[vim.bo[bufnr].filetype] then
			return
		end
		return { lsp_fallback = "never" }
	end,
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		javascript = { { "prettierd", "prettier" }, "eslint_d" },
		typescript = { { "prettierd", "prettier" }, "eslint_d" },
		vue = { { "prettierd", "prettier" }, "eslint_d" },
	},
})

-- Setup to automatically install formatters from mason
require("mason-conform").setup()
