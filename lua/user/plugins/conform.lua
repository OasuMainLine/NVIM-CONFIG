local status_ok, conform = pcall(require, "conform")

if not status_ok then
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
    djangohtml = { "djlint" }
  },

}

conform.setup(setup_ops)
