-- Telescope config

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-q>"] = "smart_send_to_qflist",
			},

			n = {
				["<C-q>"] = "smart_send_to_qflist",
			},
		},
		on_complete = {
			function(picker)
				local prompt_bufnr = picker.prompt_bufnr
				vim.keymap.set("s", lhs, rhs, { buffer = prompt_bufnr })
			end,
		},
		default_text = "test",
	},
})
local builtin = require("telescope.builtin")

-- Project search all files
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>ef", builtin.find_files, {})

-- Fuzzy find files only in git
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<C-e>", builtin.git_files, {})

-- This will start a grep search with the selection or the current word
-- defaulting to select mode (so the search string can easily be overridden)
local function custom_grep_search()
	local selection = vim.getVisualSelection()
	if string.len(selection) < 1 then
		selection = vim.fn.expand("<cword>")
	end

	require("telescope.builtin").live_grep({
		default_text = selection,
		on_complete = selection ~= ""
				and {
					function(picker)
						local mode = vim.fn.mode()
						local keys = mode ~= "n" and "<ESC>" or ""
						vim.api.nvim_feedkeys(
							vim.api.nvim_replace_termcodes(keys .. [[^v$<C-g>]], true, false, true),
							"n",
							true
						)
						-- should you have more callbacks, just pop the first one
						table.remove(picker._completion_callbacks, 1)
						-- copy mappings s.t. eg <C-n>, <C-p> works etc
						vim.tbl_map(function(mapping)
							vim.api.nvim_buf_set_keymap(0, "s", mapping.lhs, mapping.rhs, {})
						end, vim.api.nvim_buf_get_keymap(0, "i"))
					end,
				}
			or nil,
	})
end

vim.keymap.set({ "n", "x" }, "<leader>es", function()
	custom_grep_search()
end)
vim.keymap.set({ "n", "x" }, "<leader>ps", function()
	custom_grep_search()
end)
