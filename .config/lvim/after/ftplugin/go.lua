local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
	{ name = "goimports", filetypes = { "go" } }
}
