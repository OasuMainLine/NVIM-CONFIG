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
	keymap("n", "A", function()
		local node = api.tree.get_node_under_cursor()
		local absolute_path = node.absolute_path
		vim.ui.input({ prompt = "Add multiple files: " .. absolute_path .. "\\" }, function(input)
			if input == nil then
				return
			end

			local files_str = string.sub(input, 2, -2)
			for token in string.gmatch(files_str, "[^,\\s]+") do
				local trimmed_token = string.gsub(token, "%s+", "")
				local filename = absolute_path .. "\\" .. trimmed_token
				local file = io.open(filename, "w")
				if file == nil then
					vim.notify("Couldn't write file: " .. token)
					goto continue
				end
				file:close()
				::continue::
			end
			api.tree.reload()
		end)
	end, opts("Create multiple files at once"))
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
