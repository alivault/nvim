return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
  },
  config = function(_, opts)
    require("which-key.plugins.presets").operators["v"] = nil
    require("which-key").setup(opts)
  end,
}
