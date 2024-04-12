-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<bs>", "^", { desc = "Start of line (non-blank)" })
map("n", "<D-a>", "ggVG", { desc = "Select all" })
map("n", "<leader>X", "<cmd>LazyExtras<cr>", { desc = "Lazy Extras" })

-- Buffer Line
map("n", "<leader>d", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
map("n", "<C-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })
map("n", "<C-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<C-D-h>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move Buffer Left" })
map("n", "<C-D-l>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move Buffer Right" })

-- Move to window
map("n", "H", "<C-w>h", { desc = "Go to Left Window" })
map("n", "J", "<C-w>j", { desc = "Go to Lower Window" })
map("n", "K", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "L", "<C-w>l", { desc = "Go to Right Window" })
