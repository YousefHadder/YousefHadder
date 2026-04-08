vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local success = pcall(vim.fn.system, {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})

	if not success then
		vim.notify("Failed to clone lazy.nvim", vim.log.levels.ERROR)
		return
	end
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "yousef.plugins" },
	},
	checker = {
		enabled = false,
	},
	change_detection = {
		notify = false,
	},
	ui = {
		border = "rounded",
	},
})
