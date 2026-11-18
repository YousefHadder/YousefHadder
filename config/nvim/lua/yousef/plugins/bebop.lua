return {
	"ATTron/bebop.nvim",
	commit = "997b2d40a728a17d225026f9580cb5e489e82f4f",
	lazy = false,
	priority = 1000,
	config = function()
		require("bebop").setup({
			preset = "spike",
			transparent = true,
			terminal_colors = true,
		})
		vim.cmd([[colorscheme bebop]])
	end,
}
