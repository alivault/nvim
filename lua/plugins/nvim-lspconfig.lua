return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.cssls = {
        settings = {
          css = {
            lint = {
              unknownAtRules = "ignore",
            },
          },
        },
      }
      opts.servers.tsserver.settings.completions.completeFunctionCalls = false
    end,
  },
}

