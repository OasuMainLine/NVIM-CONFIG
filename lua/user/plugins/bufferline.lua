local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
	vim.notify("Couldn't find bufferline")
	return
end

bufferline.setup({
	options = {
		diagnostics = "nvim_lsp",
	},
})

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

for i = -1, 10, 1 do
	keymap(
		"n",
		"<leader>" .. i,
		[[<cmd>lua require"bufferline".go_to(]] .. i .. ", true)<CR>",
		{ desc = "Go to buffer number " .. i, silent = true }
	)
end

keymap("n", "<leader>p", [[<cmd>BufferLineCyclePrev<CR>]], opts)
keymap("n", "<leader>n", [[<cmd>BufferLineCycleNext<CR>]], opts)
