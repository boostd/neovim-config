require("flash").setup({})
local remap = vim.keymap.set

remap({ "n", "x" }, "s", function() require("flash").jump() end)
remap({ "n", "x" }, "S", function() require("flash").treesitter() end)
remap("o", "r", function() require("flash").remote() end)
remap({ "o", "x" }, "R", function() require("flash").treesitter_search() end)
remap("c", "<c-s>", function() require("flash").toggle() end)
