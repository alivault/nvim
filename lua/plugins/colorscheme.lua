return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      on_colors = function(colors)
        colors.bg = colors.bg_dark
        colors.bg_visual = "#33467C"
        -- colors.gitSigns.add = colors.green
        -- colors.gitSigns.change = colors.blue
        -- colors.gitSigns.delete = colors.red1
      end,
    },
  },
  { "Mofiqul/vscode.nvim", event = "User LazyColorscheme" },
  { "rebelot/kanagawa.nvim", event = "User LazyColorscheme" },
  { "catppuccin/nvim", event = "User LazyColorscheme" },
}
