-- Go Debug
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
	{ name = "goimports", filetypes = { "go" } }
}

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- local file = io.open('.env', "r")
-- local arr = {}
-- if file then
-- 	for line in file:lines() do
-- 		table.insert(arr, line)
-- 	end
-- end
local dlvPath = "/opt/homebrew/bin/dlv"
dap.configurations.go = {
	{
		type = "go",
		name = "Debug",
		request = "launch",
		program = "${workspaceFolder}/cmd/api",
		-- env = arr,
		envFile = "${workspaceFolder}/cmd/api/.env",
		dlvToolPath = vim.fn.exepath(dlvPath),
	},
	{
		type = "go",
		name = "Debug curr test",
		request = "launch",
		mode = "test",
		program = "${file}",
		dlvToolPath = vim.fn.exepath(dlvPath)
	},
	{
		type = "go",
		name = "Attach",
		request = "attach",
		processId = require("dap.utils").pick_process,
		program = "${workspaceFolder}/cmd/api",
		dlvToolPath = vim.fn.exepath(dlvPath)
	},
	{
		type = "go",
		name = "Debug curr file",
		request = "launch",
		program = "${file}",
		dlvToolPath = vim.fn.exepath(dlvPath)
	},
	{
		type = "go",
		name = "Debug test",
		request = "launch",
		mode = "test",
		program = "${workspaceFolder}",
		dlvToolPath = vim.fn.exepath(dlvPath)
	},
}
