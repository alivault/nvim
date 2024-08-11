return {
  "brenton-leighton/multiple-cursors.nvim",
  version = "*", -- Use the latest tagged version
  opts = {
    pre_hook = function()
      vim.opt.cursorline = false
      vim.cmd("NoMatchParen")
      vim.g.minipairs_disable = true
      require("cmp").setup({ enabled = false })
    end,
    post_hook = function()
      vim.opt.cursorline = true
      vim.cmd("DoMatchParen")
      vim.g.minipairs_disable = false
      require("cmp").setup({ enabled = true })
    end,
    custom_key_maps = {
      {
        "n",
        "<leader>a",
        function()
          require("multiple-cursors").align()
        end,
      },
    },
  },
  keys = {
    { "<D-A-j>", "<Cmd>MultipleCursorsAddDown<CR>", desc = "Add cursor down" },
    { "<D-A-k>", "<Cmd>MultipleCursorsAddUp<CR>", desc = "Add cursor up" },
    { "<A-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" }, desc = "Add or delete cursor" },
    { "<D-d>", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Add cursor to next match" },
    {
      "<leader>A",
      "<Cmd>MultipleCursorsAddMatches<CR>",
      mode = { "n", "x" },
      desc = "Add cursor too all visible matches",
    },
    { "<leader>n", "<Cmd>MultipleCursorsJumpNextMatch<CR>", desc = "Move cursor to next match" },
  },
}
