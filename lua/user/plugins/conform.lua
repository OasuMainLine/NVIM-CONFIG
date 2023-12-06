local status_ok, conform = pcall(require, "conform")

if not status_ok then
	use("m4xshen/autoclose.nvim")
	vim.notify("couldn't find conform")
	return
end

local setup_ops = {
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "dprint" },
		djangohtml = { "djlint" },
	},

	format_on_save = {
		timeout = 500,
		async = true,
		lsp_fallback = true,
	},
}
local M = {}

M.setup = function()
	conform.setup(setup_ops)
end

return M
