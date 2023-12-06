local subscribe = vim.api.nvim_create_autocmd

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

subscribe({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	pattern = "*.*",
	callback = function()
		local status_ok, lint = pcall(require, "lint")

		if not status_ok then
			vim.notify("Couldn't lint file, couldnt find nvim-lint")
			return
		end
		lint.try_lint()
	end,
})
subscribe({ "BufEnter" }, {
	callback = function()
		local filetype = vim.bo.filetype
		if filetype == "python" then
			local status_ok, venv_selector = pcall(require, "venv-selector")
			if not status_ok then
				vim.notify("Couldn't retrieve venv, no venv_selector'")
				return
			end
			local status_ok, _ = venv_selector.get_active_venv()
			if not status_ok then
				venv_selector.retrieve_from_cache()
			end
		end
	end,
})
