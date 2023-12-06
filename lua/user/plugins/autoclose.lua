local status_ok, autoclose = pcall(require, "autoclose")
if not status_ok then
	vim.notify("Couldn't load autoclose")
	return
end

autoclose.setup()
