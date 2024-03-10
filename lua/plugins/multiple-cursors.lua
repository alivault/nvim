return {
  "brenton-leighton/multiple-cursors.nvim",
  version = "*", -- Use the latest tagged version
  opts = {}, -- This causes the plugin setup function to be called
  keys = {
    { "<D-A-j>", "<Cmd>MultipleCursorsAddDown<CR>", desc = "Add cursor down" },
    { "<D-A-k>", "<Cmd>MultipleCursorsAddUp<CR>", desc = "Add cursor up" },
    { "<A-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" }, desc = "Add or delete cursor" },
    { "<leader>a", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Add cursor to next match" },
    {
      "<leader>A",
      "<Cmd>MultipleCursorsAddMatches<CR>",
      mode = { "n", "x" },
      desc = "Add cursor too all visible matches",
    },
    { "<Leader>n", "<Cmd>MultipleCursorsJumpNextMatch<CR>", desc = "Move cursor to next match" },
  },
}
