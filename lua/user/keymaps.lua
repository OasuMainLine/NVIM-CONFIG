local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- Helper global to close terminals
function Close_all_terminal_buffers()
	local buffers = vim.fn.getbufinfo({ buftype = "terminal" })
	for _, buffer in ipairs(buffers) do
		local bufnr = buffer.bufnr
		local buftype = vim.api.nvim_buf_get_option(bufnr, "buftype")
		if buftype == "terminal" then
			vim.cmd("bd! " .. buffer.bufnr)
		end
	end
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<S-tab>", "<gv^", opts)
keymap("v", "<tab>", ">gv^", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- File related commands
-- Quit and save all buffers
keymap("n", "<leader>q", ":wqa<CR>")

-- Quits all buffers while saving
keymap("n", "<leader>w", function()
	Close_all_terminal_buffers()
	vim.cmd("wqa!")
end, opts)
-- Save current file
keymap("n", "<leader>s", "<cmd>w<CR>", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)
-- better selection
keymap("n", "<leader>a", "ggVG")
-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
keymap("t", "<esc>", "<C-\\><C-N>", term_opts)
--
--
-- Plugins --
-- Plugin related keymaps

-- Telescope
-- Open find_files
keymap("n", "<leader>f", function()
	local status_ok, builtin = pcall(require, "telescope.builtin")
	if not status_ok then
		vim.notify("Can't execute telescope keymap, no builtins found")
		return
	end
	local themes = require("telescope.themes")
	builtin.find_files(themes.get_dropdown({ previewer = false }))
end, opts)
-- Open find_buffer
keymap("n", "<leader>b", function()
	local status_ok, builtin = pcall(require, "telescope.builtin")
	if not status_ok then
		vim.notify("Can't execute telescope keymap, no builtins found'")
		return
	end
	local themes = require("telescope.themes")
	builtin.buffers(themes.get_dropdown({ previewer = false }))
end)
-- Toggle NvimTree
keymap("n", "<leader>d", ":NvimTreeToggle<CR>", opts)
keymap("x", "<leader>c", "gc", opts)
-- Toggle Telescope project
keymap("n", "<leader>p", ':lua require("telescope").extensions.project.project{}<CR>')
-- Conform - formatting
keymap({ "n", "v" }, "<leader>fm", function()
	local status_ok, conform = pcall(require, "conform")
	if not status_ok then
		vim.notify("Couldn't format, conform not found")
		return
	end
	conform.format()
end, { desc = "Format current file or range" })

-- Linting
keymap("n", "<leader>l", function()
	local status_ok, lint = pcall(require, "lint")
	if not status_ok then
		vim.notify("Couldn't find lint")
		return
	end

	lint.try_lint()
	vim.notify("linted")
end, opts)
-- Close all buffers but this one
keymap("n", "<leader>ca", [[<cmd>%bd|e#|bd#<CR>]], opts)
keymap("n", "<leader>ct", "<cmd>lua Close_all_terminal_buffers()<CR>", opts)
