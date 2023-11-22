local M = {
}

local ignored_langs = {"haskell", "ocaml", "matlab", "erlang", "elm", "clojure",}
local ensured_langs ={ "lua", "markdown", "markdown_inline", "bash", "dockerfile", "python", "json", "json5", "yaml", "toml", "sql", "scss", "css", "javascript", "typescript", "html", "htmldjango", "rust", "tsx"} -- put the language you want in this array 
function M.config()
  local status_ok, treesitter =  pcall(require, "nvim-treesitter")
  if not status_ok then
      vim.notify("No treesitter found")
      return
  end

  local configs = require "nvim-treesitter.configs"

  configs.setup {
    ensure_installed = ensured_langs, 
    -- ensure_installed = "all", -- one of "all" or a list of languages
    ignore_install = ignored_langs,                                                       -- List of parsers to ignore installing
    sync_install = false,                                                          -- install languages synchronously (only applied to `ensure_installed`)

    highlight = {
      enable = true,       -- false will disable the whole extension
      disable = { "css" }, -- list of language that will be disabled
    },
    autopairs = {
      enable = true,
    },
    indent = { enable = true, disable = { "python", "css" } },

    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  }
end

return M
