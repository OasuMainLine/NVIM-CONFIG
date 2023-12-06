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
		button("SPC o h", "󰊄  Recently opened files", "<cmd>Telescope oldfiles <CR>"),
		button("SPC o m", "  Open project", "<cmd>Telescope project <CR>"),
		button("SPC s", "  Open last session", [[<cmd>lua require("sessions").load()<CR>]]),
	},
	opts = {
		spacing = 1,
	},
}

theme.section.footer.val = "Configuration by OasuMainLine"
theme.config.layout[4] = buttons

alpha.setup(theme.config)
