local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
	{
		command = "prettier",
		---@usage arguments to pass to the formatter
		-- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
		extra_args = { "--print-with", "100" },
		filetypes = { "typescript" },
	},
}
