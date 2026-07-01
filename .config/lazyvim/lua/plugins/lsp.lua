return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        gopls = function(_, opts)
          local on_attach = opts.on_attach

          opts.on_attach = function(client, bufnr)
            client.server_capabilities.semanticTokensProvider = nil

            if on_attach then
              on_attach(client, bufnr)
            end
          end
        end,
      },
      servers = {
        gopls = {
          settings = {
            gopls = {
              analyses = {
                ST1000 = false,
                ST1003 = false,
              },
            },
          },
        },
      },
    },
  },
}
