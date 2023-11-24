local status_ok, lint = pcall(require, "lint")

if not status_ok then
  vim.notify("Couldn't load nvim lint")
  return
end
local web_linters = { "eslint_d" }
lint.linters_by_ft = {
  javascript = web_linters,
  typescript = web_linters,
  javascriptreact = web_linters,
  typescriptreact = web_linters,
  python = { "pylint" },
  rust = { "ast-grep" },
  lua = { "luacheck" }
}
