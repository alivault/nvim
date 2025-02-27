-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del

-- General
map("n", "<D-a>", "ggVG", { desc = "Select all" })
del("n", "<leader>l") -- delete default Lazy keymap
del("n", "<leader>L") -- delete default Lazy Changelog keymap
map("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>lx", "<cmd>LazyExtras<cr>", { desc = "Lazy Extras" })
map("n", "<leader>lc", function()
  LazyVim.news.changelog()
end, { desc = "LazyVim Changelog" })
map("n", "<leader>L", "<cmd>LspRestart<cr>", { desc = "LSP Restart" })
map("n", "<C-c>", "ciw", { desc = "Change inner word" })

-- Buffer Line
map("n", "<leader>d", "<cmd>bdelete<cr>", { desc = "Close Buffer" })
map({ "n", "v" }, "<C-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })
map({ "n", "v" }, "<C-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<C-D-h>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move Buffer Left" })
map("n", "<C-D-l>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move Buffer Right" })

-- Move to window
map("n", "H", "<C-w>h", { desc = "Go to Left Window" })
map("n", "J", "<C-w>j", { desc = "Go to Lower Window" })
map("n", "K", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "L", "<C-w>l", { desc = "Go to Right Window" })

-- Reveal the current file in Finder (macOS)
map("n", "<leader>r", "<cmd>silent !open -R %:p<cr>", { desc = "Reveal in Finder" })
