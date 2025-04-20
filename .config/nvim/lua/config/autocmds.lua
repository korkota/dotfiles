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
