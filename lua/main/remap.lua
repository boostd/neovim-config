-- Map leader key
vim.g.mapleader = " "

-- Easy way to exit file into current directory
vim.keymap.set("n", "<leader>pv", vim.cmd.E)

-- Map <A-j> and <A-k> to move lines up and down respectively
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==')
vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
vim.keymap.set('v', '<A-j>', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', '<A-k>', ':m \'<-2<CR>gv=gv')

-- Map <A-y> and <A-p> to yank and put to the system register
vim.keymap.set('n', '<A-y>', '"*y')
vim.keymap.set('n', '<A-p>', '"*p')
vim.keymap.set('v', '<A-y>', '"*y')
vim.keymap.set('v', '<A-p>', '"*p')

-- Map <C-d>, <C-u>, and searching to also center the cursor
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Don't overwrite the register with the text being replaced/deleted
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Never ever press Q!!!
vim.keymap.set("n", "Q", "<nop>")

-- Quick Fix navigation
vim.keymap.set("n", "<C-K>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-J>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Start replacing the current word in the current file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable (only works on UNIX like systems!)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Quickly source the current file into config
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Efficient movement between windows
vim.keymap.set({"n", "v"}, "<leader>hh", "<C-w>h")
vim.keymap.set({"n", "v"}, "<leader>ll", "<C-w>l")
vim.keymap.set({"n", "v"}, "<leader>kk", "<C-w>k")
vim.keymap.set({"n", "v"}, "<leader>jj", "<C-w>j")
