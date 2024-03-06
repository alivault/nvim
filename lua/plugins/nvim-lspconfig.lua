return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- Ensures that the 'servers' table exists or initializes it
    opts.servers = opts.servers or {}

    -- Configuring CSS language server settings
    -- Here we either extend existing `cssls` settings or create a new one
    local csslsSettings = opts.servers.cssls or {}
    csslsSettings.settings = {
      css = {
        lint = {
          unknownAtRules = "ignore",
        },
      },
    }

    -- Placing the configured settings back into the main configurations
    opts.servers.cssls = csslsSettings

    -- Your existing or additional configuration modifications can go here
  end,
}
