local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
	{
		command = "prettier",
		extra_args = { "--print-with", "100" },
		---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
		filetypes = { "typescriptreact" },
	},
}
