-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.scrolloff = 10
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.smarttab = true
-- popup menu transparency
opt.pumblend = 0

opt.shell = "/bin/zsh"

opt.guicursor = "n-v-i-c:block,i-ci-ve:block-Cursor,r-cr-o:block-Cursor"

vim.o.termguicolors = true

-- Global
vim.g.neovide_refresh_rate = 60
vim.g.neovide_refresh_rate_idle = 5

-- LSP hover border
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
