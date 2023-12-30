local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	vim.notify("Couldn't load none-ls")
	return
end
local M = {}
M.setup = function()
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.prettier,
		},
	})

	vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
end

return M
