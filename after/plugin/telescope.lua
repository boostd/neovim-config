-- Telescope config

local builtin = require('telescope.builtin')

-- Project search all files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

-- Fuzzy find just files in git
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- Grep live
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

-- Grep selection
vim.keymap.set('x', '<leader>ps', function()
  local text = vim.getVisualSelection()
  builtin.grep_string({ default_text = text })
end)


-- Function to get the current selected text
function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

