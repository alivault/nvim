return {
  "folke/which-key.nvim",
  config = function(opts)
    require("which-key.plugins.presets").operators["v"] = nil
    require("which-key").setup(opts)
  end,
}
