-- Telescope config

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-q>"] = "smart_send_to_qflist"
      },

      n = {
        ["<C-q>"] = "smart_send_to_qflist"
      }
    }
  }
}
local builtin = require('telescope.builtin')

-- Project search all files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ef', builtin.find_files, {})

-- Fuzzy find files only in git
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<C-e>', builtin.git_files, {})

-- Grep live
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>es', builtin.live_grep, {})

-- Grep selection
vim.keymap.set('x', '<leader>ps', function()
  local text = vim.getVisualSelection()
  builtin.grep_string({ default_text = text })
end)
vim.keymap.set('x', '<leader>es', function()
  local text = vim.getVisualSelection()
  builtin.grep_string({ default_text = text })
end)

