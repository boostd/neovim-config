-- Map leader key
vim.g.mapleader = " "

-- Easy way to exit file into current directory
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ev", vim.cmd.Ex)

-- Map <A-j> and <A-k> to move lines up and down respectively
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Map <A-y> and <A-p> to yank and put to the system register
vim.keymap.set("n", "<A-y>", '"*y', { silent = true })
vim.keymap.set("n", "<A-p>", '"*p', { silent = true })
vim.keymap.set("v", "<A-y>", '"*y', { silent = true })
vim.keymap.set("v", "<A-p>", '"*p', { silent = true })
vim.keymap.set("i", "<A-y>", '<Esc>"*y', { silent = true })
vim.keymap.set("i", "<A-p>", '<Esc>"*p', { silent = true })

-- Map <C-d>, <C-u>, and searching to also center the cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Don't overwrite the register with the text being replaced/deleted
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Never ever press Q!!!
vim.keymap.set("n", "Q", "<nop>")

-- Start replacing the current word in the current file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable (only works on UNIX like systems!)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Add scroll 1 line up functionality to <C-g>
vim.keymap.set("n", "<C-g>", "<C-e>")

-- Quickly source the current file into config
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

-- Exit from select mode using arrow keys
vim.keymap.set("s", "<Up>", "<Esc><Up>")
vim.keymap.set("s", "<Down>", "<Esc><Down>")

-- Efficient movement between windows
vim.keymap.set({ "n", "v" }, "<leader>hh", "<C-w>h")
vim.keymap.set({ "n", "v" }, "<leader>ll", "<C-w>l")
vim.keymap.set({ "n", "v" }, "<leader>kk", "<C-w>k")
vim.keymap.set({ "n", "v" }, "<leader>jj", "<C-w>j")
vim.keymap.set({ "n", "v" }, "<leader><Left>", "<C-w>h")
vim.keymap.set({ "n", "v" }, "<leader><Right>", "<C-w>l")
vim.keymap.set({ "n", "v" }, "<leader><Up>", "<C-w>k")
vim.keymap.set({ "n", "v" }, "<leader><Down>", "<C-w>j")

-- Close buffers easily
vim.keymap.set("n", "<leader>q", "<C-w>q")
vim.keymap.set("n", "<leader>c", "<C-w>q")

-- Yank and paste all text in buffer
vim.keymap.set("n", "<leader>yy", 'ggVG"*y<C-o>')
vim.keymap.set("n", "<leader>pp", 'ggVG"*p<C-o>')

-- Delete all hidden, unmodified, non-terminal buffers
vim.keymap.set("n", "<C-Q>", function()
	local api = vim.api
	local active_buffers = {}
	for _, win in ipairs(api.nvim_list_wins()) do
		active_buffers[api.nvim_win_get_buf(win)] = true
	end
	local count = 0
	local buffers = api.nvim_list_bufs()
	for _, buf in ipairs(buffers) do
		if
			active_buffers[buf] ~= true
			and api.nvim_buf_get_option(buf, "modified") ~= true
			and api.nvim_buf_get_option(buf, "buftype") ~= "terminal"
		then
			api.nvim_buf_delete(buf, {})
			count = count + 1
		end
	end
	api.nvim_out_write(string.format("Deleted %d hidden and unmodified buffers\n", count))
end, { desc = "Delete all unmodified hidden buffers" })

-- Quick Fix navigation
vim.keymap.set("n", "<C-F>", "<cmd>cclose<CR><cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-M>", "<cmd>cclose<CR><cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

local function replaceFirstWithSecond()
	local pattern = vim.fn.input("Enter the pattern to replace: ")
	local replacement = vim.fn.input("Enter the replacement: ")

	vim.cmd("%s/" .. pattern .. "/" .. replacement .. "/g")
end

local function replaceSelectionWithInput()
	local pattern = vim.getVisualSelection()
	local replacement = vim.fn.input("Enter the replacement: ")

	vim.cmd("%s/" .. pattern .. "/" .. replacement .. "/g")
end

-- Replace the first pattern with the second pattern from the quick fix list.
vim.keymap.set(
	"n",
	"<leader>pr",
	replaceFirstWithSecond,
	{ desc = "Replace the first pattern with the second pattern from the quick fix list." }
)
vim.keymap.set(
	"n",
	"<leader>er",
	replaceFirstWithSecond,
	{ desc = "Replace the first pattern with the second pattern from the quick fix list." }
)

-- Replace the selection with the pattern from the quick fix list
vim.keymap.set(
	"x",
	"<leader>pr",
	replaceSelectionWithInput,
	{ desc = "Replace the selection with the pattern from the quick fix list" }
)
vim.keymap.set(
	"x",
	"<leader>er",
	replaceSelectionWithInput,
	{ desc = "Replace the selection with the pattern from the quick fix list" }
)
