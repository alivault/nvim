return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = { delete_to_trash = true },
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  keys = {
    { "<leader>o", "<cmd>Oil<cr>", desc = "Oil File Browser" },
  },
}
