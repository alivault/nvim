return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- Extend the 'ensure_installed' list to include Markdown parsers
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
    end

    -- Automatically set filetype for .mdx files to markdown
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = "*.mdx",
      callback = function()
        vim.bo.filetype = "markdown"
      end,
    })
  end,
}
