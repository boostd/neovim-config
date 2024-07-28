-- Use curl and tar for Windows as well
require("nvim-treesitter.install").prefer_git = false

-- Use clang as the compiler of parsers
require("nvim-treesitter.install").compilers = { "clang" }

-- Add D2lang (https://github.com/terrastruct/d2) support
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.d2 = {
	install_info = {
		url = "https://github.com/pleshevskiy/tree-sitter-d2",
		revision = "main",
		files = { "src/parser.c", "src/scanner.cc" },
	},
	filetype = "d2",
}
vim.api.nvim_command([[autocmd BufNewFile,BufRead *.d2 setfiletype d2]])

-- Treesitter config
require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {
		"vimdoc",
		"javascript",
		"typescript",
		"java",
		"python",
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"vue",
		"css",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},

	-- helps with python to fix super weird indenting
	indent = {
		enable = true,
	},
})
