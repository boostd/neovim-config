
-- Disable language provider support (lua and vimscript plugins only)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0


-- Relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true


-- Tab size 4
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true


-- Don't wrap
vim.opt.wrap = false


-- Set persistent undo and remove swapfile
if vim.fn.has("persistent_undo") == 1 then
    local target_path = vim.fn.expand("~/.undodir")

    -- Create the directory and any parent directories if the location does not exist
    if vim.fn.isdirectory(target_path) == 0 then
        vim.fn.mkdir(target_path, "p", 0700)
    end

    vim.o.undodir = target_path
    vim.o.undofile = true

    vim.o.swapfile = false  -- Fuck swapfiles
    vim.o.backup = false
end


-- Incremental search with no highlight. Also enables smartcase
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.o.ignorecase = true
vim.o.smartcase = true


-- Fast updates
vim.opt.updatetime = 50


-- Line length guidance
vim.opt.colorcolumn = "140"


-- Map leader key to spacebar
vim.g.mapleader = " "

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 300 }
  end,
})




-- Miscellaneous
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
