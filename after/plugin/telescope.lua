-- Telescope config

local builtin = require('telescope.builtin')

-- Project search all files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

-- Fuzzy find just files in git
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- Project search
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)


