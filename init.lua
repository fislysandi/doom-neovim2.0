-- init.lua - Fresh Neovim Configuration
-- A minimal, modern Neovim setup with lazy.nvim

-- Set leader keys first (must be before any keymaps)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Core settings
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Load plugins
require("lazy").setup("plugins")
