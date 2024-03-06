return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- Ensure 'servers' configuration exists
    opts.servers = opts.servers or {}

    -- Extend or set CSS LSP server settings
    local csslsSettings = opts.servers.cssls or {}
    csslsSettings.settings = {
      css = {
        lint = {
          unknownAtRules = "ignore",
        },
      },
    }

    -- Apply the settings
    opts.servers.cssls = csslsSettings

    -- Additional configuration modifications can go here
  end,
}
