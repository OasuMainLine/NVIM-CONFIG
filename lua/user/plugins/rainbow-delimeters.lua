local status_ok, rainbow = pcall(require, "rainbow-delimiters.setup")
if not status_ok then
	vim.notify("Couldn't load rainbow delimeters'")
	return
end

rainbow.setup({
	highlight = {
		"RainbowDelimiterYellow",
		"RainbowDelimiterBlue",
		"RainbowDelimiterOrange",
		"RainbowDelimiterGreen",
		"RainbowDelimiterViolet",
		"RainbowDelimiterCyan",
		"RainbowDelimiterRed",
	},
})
