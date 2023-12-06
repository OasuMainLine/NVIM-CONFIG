local status_ok, venv_selector = pcall(require, "venv-selector")
if not status_ok then
	vim.notify("Couldn't load venv selector'")
	return
end

venv_selector.setup()
