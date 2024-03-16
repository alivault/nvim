return {
  "echasnovski/mini.files",
  keys = {
    {
      "<leader>m",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "Open mini.files (at current file)",
    },
  },
}
