-- lua/core/options.lua - Neovim Options

-- Enable true colors
vim.opt.termguicolors = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs and indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Line wrapping
vim.opt.wrap = false

-- Search settings
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Cursor line
vim.opt.cursorline = true

-- Appearance
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

-- Update time
vim.opt.updatetime = 50

-- Split behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable mouse
vim.opt.mouse = "a"

-- Clipboard integration
vim.opt.clipboard = "unnamedplus"

-- Disable netrw (we'll use a file explorer plugin)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Completeopt for better completion experience
vim.opt.completeopt = { "menu", "menuone", "noselect" }
