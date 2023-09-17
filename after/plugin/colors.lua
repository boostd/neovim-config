function ColorMyPencils(color)
	color = color or "dracula"
	vim.cmd.colorscheme(color)

	-- Make background transparent. I don't like it (and doesn't work on Windows) so not gonna enable it currently.
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end


ColorMyPencils()
