vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazycommit = "85c7ff3711b730b4030d03144f6db6375044ae82"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--no-checkout",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_err_writeln("Failed to clone lazy.nvim")
		vim.cmd.cquit()
	end
end

-- Enforce the bootstrap revision even when the data directory already exists.
vim.fn.system({ "git", "-C", lazypath, "checkout", "--detach", lazycommit })
if vim.v.shell_error ~= 0 then
	vim.api.nvim_err_writeln("Failed to check out the pinned lazy.nvim revision")
	vim.cmd.cquit()
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ "folke/lazy.nvim", commit = lazycommit, pin = true },
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
