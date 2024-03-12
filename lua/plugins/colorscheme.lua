return {
  "folke/tokyonight.nvim",
  opts = {
    style = "night",
    on_colors = function(colors)
      colors.bg = colors.bg_dark
      colors.bg_visual = "#33467C"
    end,
  },
}
