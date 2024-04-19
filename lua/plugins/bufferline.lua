return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      show_buffer_close_icons = false,
      move_wraps_at_ends = true,
      indicator = {
        style = "none",
      },
      style_preset = {
        require("bufferline").style_preset.no_italic,
        require("bufferline").style_preset.no_bold,
      },
    },
  },
}
