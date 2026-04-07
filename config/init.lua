-- Minimal neovim options for profile GIF recording
-- Subset of yousef/config/options.lua, CI-safe (works on Neovim 0.9+)
local opt = vim.opt
local cmd = vim.cmd

-- UI options
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.wrap = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.colorcolumn = "120"
opt.laststatus = 3
opt.termguicolors = true

-- Split options
opt.splitbelow = true
opt.splitright = true

-- Search options
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Indentation options
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.autoindent = true
opt.smartindent = true

-- Disable swap/backup
opt.swapfile = false
opt.backup = false

-- Performance
opt.updatetime = 50
opt.timeoutlen = 300

-- Comment styling
cmd([[hi Comment guifg=#e0e0e0 gui=italic]])
cmd([[highlight ColorColumn ctermbg=236 guibg=#3a3a3a]])
