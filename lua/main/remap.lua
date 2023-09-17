-- Set up low updatetime
vim.o.updatetime = 500

-- Map leader key to spacebar
vim.g.mapleader = " "


-- Easy way to exit file into current directory
vim.keymap.set("n", "<leader>pv", vim.cmd.E)

-- Map <A-j> and <A-k> to move lines up and down respectively
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })

-- Map <A-y> and <A-p> to yank and put to the system register
vim.api.nvim_set_keymap('n', '<A-y>', '"*y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-p>', '"*p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-y>', '"*y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-p>', '"*p', { noremap = true, silent = true })

-- Map <C-d> and <C-u> to also center the cursor
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

