-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>U", vim.cmd.UndotreeToggle, { desc = "Toggle the undo tree" })

vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from the clipboard" })
vim.keymap.set("n", "<leader>P", [["+P]], { desc = "Paste from the clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to the clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to the clipboard" })

vim.keymap.set("i", "№", "#")

-- TIP: :so %
