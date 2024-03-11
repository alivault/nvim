return {
  "stevearc/oil.nvim",
  opts = {
    delete_to_trash = true,
    keymaps = {
      ["?"] = "actions.show_help",
      ["<leader>o"] = "actions.close",
      ["<C-k>"] = "actions.parent",
      ["<C-j>"] = "actions.select",
      ["go"] = "actions.open_external",
      ["gt"] = "actions.toggle_trash",
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>o", "<cmd>Oil<cr>", desc = "Oil File Browser" },
  },
}
