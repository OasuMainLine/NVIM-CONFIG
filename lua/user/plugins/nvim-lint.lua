local status_ok, lint = pcall(require, "lint")

if not status_ok then
	vim.notify("Couldn't load nvim lint")
	return
end
local web_linters = { "eslint_d", "compiler" }

lint.linters_by_ft = {
	javascript = web_linters,
	typescript = web_linters,
	javascriptreact = web_linters,
	typescriptreact = web_linters,
	lua = { "luacheck" },
	djangohtml = { "djlint" },
}

vim.diagnostic.config({
	virtual_text = {
		severity = { min = vim.diagnostic.severity.ERROR },
	},
	signs = true,
	underline = true,
})

lint.linters["luacheck"].args = { "-globals", '["vim"]', "--formatter", "plain", "--codes", "--ranges", "-" }
