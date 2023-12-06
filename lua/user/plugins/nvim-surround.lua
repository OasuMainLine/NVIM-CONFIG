local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
	vim.notify("Couldn't find surround")
	return
end

surround.setup({})
