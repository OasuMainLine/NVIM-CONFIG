local status_ok, alpha = pcall(require, "alpha")

if not status_ok then
  vim.notify("Couldn't find alpha")
  return
end

local theme = require("alpha.themes.dashboard")
local button = theme.button
local buttons = {
    type = "group",
    val = {
        button("e", "  New file", "<cmd>ene <CR>"),
        button("SPC s h", "󰊄  Recently opened files"),
        button("SPC s r", "  Frecency/MRU"),
        button("SPC s g", "󰈬  Find word"),
        button("SPC s m", "  Jump to bookmarks"),
        button("SPC s l", "  Open last session"),
    },
    opts = {
        spacing = 1,
    },
}


theme.config["opts"] = {
    
}
alpha.setup(theme.config)
