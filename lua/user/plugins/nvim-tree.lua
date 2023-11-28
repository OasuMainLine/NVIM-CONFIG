local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then
	vim.notify("Couldn't find nvim-tree")
	return
end

-- empty setup using defaults
nvim_tree.setup()

-- function to set keybindings
local function on_nvim_tree_attach(bufnr)
	local api = require("nvim-tree.api")

	-- function to dinamically set keybindings options
	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	-- Set default keybindings
	api.config.mappings.default_on_attach(bufnr)

	--Set custom keybindings
	local keymap = vim.keymap.set
end

nvim_tree.setup({
	sort = {
		sorter = "case_sensitive",
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
	on_attach = on_nvim_tree_attach,
})
