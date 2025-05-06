-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Filetypes to enable spellcheck
local spell_types = {
  "bash",
  "javascript",
  "javascriptreact",
  "javascript.jsx",
  "lua",
  "sh",
  "typescript",
  "typescriptreact",
  "typescript.tsx",
}

-- Create an augroup for spellcheck to group related autocommands
vim.api.nvim_create_augroup("Code spellcheck", { clear = true })

-- Create an autocommand to enable spellcheck for specified file types
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "Code spellcheck", -- Grouping the command for easier management
  pattern = spell_types, -- Only apply to these file types
  callback = function()
    vim.opt_local.spell = true -- Enable spellcheck for these file types
  end,
  desc = "Enable spellcheck for defined filetypes", -- Description for clarity
})

vim.api.nvim_create_augroup("Obsidian settings", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  group = "Obsidian settings",
  pattern = vim.fn.expand("~") .. "/syncthing/obsidian/*.md",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.textwidth = 80
    vim.opt_local.colorcolumn = "81"
  end,
  desc = "Settings for Obsidian files",
})

vim.api.nvim_create_user_command(
  "Accent",
  [[exe "normal a\<c-v>u0301\<c-c>"]],
  { desc = "Insert the accent unicode symbol" }
)

-- Disable autoformat for lua files
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "lua" },
--   callback = function()
--     vim.b.autoformat = false
--   end,
-- })

-- Autoformat setting
-- local set_autoformat = function(pattern, bool_val)
--   vim.api.nvim_create_autocmd({ "FileType" }, {
--     pattern = pattern,
--     callback = function()
--       vim.b.autoformat = bool_val
--     end,
--   })
-- end
