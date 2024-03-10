-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- LazyExtras
map("n", "<leader>X", "<cmd>LazyExtras<cr>", { desc = "Lazy Extras" })

-- Lazy color scheme picker
local telescope = require("telescope.builtin")
local function openColorschemePickerWithEvent()
  -- Trigger the User LazyColorscheme event
  vim.cmd("doautocmd User LazyColorscheme")
  -- Then open the colorscheme picker
  telescope.colorscheme({ enable_preview = true })
end
-- Set the keymap to call the function
map("n", "<leader>uC", openColorschemePickerWithEvent, { desc = "Colorscheme with preview" })
