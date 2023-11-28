local status_ok, luasnip = pcall(require, "luasnip")

if not status_ok then
  vim.notify("Couldn't load snippets, no luasnip")
  return
end

local s = luasnip.snippet
local sn = luasnip.snippet_node
local isn = luasnip.indent_snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node
local r = luasnip.restore_node
local ri = require("luasnip.extras").rep
local general_snippets = {
}

local lua_snippets = {
  s({
      trig = "reqp",
      name = "Safe Require",
      desc = "Require a package in a safe way",
    },
    {
      t("local status_ok, "), i(1, "package"), t(" = "), t([[pcall(require, "]]), ri(1, "package"), t([[")]]),
      t({ "", "if not status_ok then" }),
      t({ "", "\t\t" }), t("vim.notify(\""), i(2, "msg"), t("\")"),
      t({ "", "\t\t", }), t("return"),
      t({ "", "end" })
    }),
}

luasnip.add_snippets("lua", lua_snippets)
luasnip.add_snippets(nil, general_snippets)
