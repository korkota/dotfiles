-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "]<Space>", "m`o<Esc>``", { desc = "Add the empty line below" })
vim.keymap.set("n", "[<Space>", "m`O<Esc>``", { desc = "Add the empty line above" })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>U", vim.cmd.UndotreeToggle, { desc = "Toggle the undo tree" })

vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from the clipboard" })
vim.keymap.set("n", "<leader>P", [["+P]], { desc = "Paste from the clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to the clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to the clipboard" })
