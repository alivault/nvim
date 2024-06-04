return {
  "neovim/nvim-lspconfig",
  opts = {
    document_highlight = {
      enabled = false,
    },
    inlay_hints = {
      enabled = false,
    },
    servers = {
      cssls = {
        settings = {
          css = {
            lint = {
              unknownAtRules = "ignore",
            },
          },
        },
      },
      tsserver = {
        settings = {
          completions = {
            completeFunctionCalls = false,
          },
        },
      },
    },
  },
}
