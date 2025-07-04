-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_prettier_needs_config = true
vim.g.snacks_animate = false
vim.g.undotree_WindowLayout = 3
vim.g.XkbSwitchEnabled = 1
vim.g.XkbSwitchLib = "/usr/lib/libg3kbswitch.so"

vim.opt.breakindent = true
vim.opt.clipboard = ""
vim.opt.exrc = true
vim.opt.shell = "/bin/bash"
vim.opt.spellfile = vim.fn.expand("~") .. "/syncthing/nvim/spell/custom.utf-8.add"
vim.opt.spelllang = { "ru", "en_us", "la" }
vim.opt.spelloptions = { "camel" }
vim.opt.swapfile = false
vim.opt.undofile = true

vim.cmd([[exe 'digr ac ' .. 0x0301]])
vim.cmd([[exe 'digr ep ' .. 0x220E]])
vim.cmd([[exe 'digr ne ' .. 0x2209]])
vim.cmd([[exe 'digr nc ' .. 0x220C]])
