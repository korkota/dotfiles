-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_prettier_needs_config = false
vim.g.undotree_WindowLayout = 3

vim.opt.spelllang = { "ru", "en_us" }
vim.opt.breakindent = true

vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.clipboard = ""

-- vim.opt.colorcolumn = "80"

vim.opt.shell = "/bin/bash"
