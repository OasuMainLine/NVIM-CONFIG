local subscribe = vim.api.nvim_create_autocmd

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

subscribe({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		local status_ok, lint = pcall(require, "lint")
		if not status_ok then
			vim.notify("Couldn't lint file, couldnt find nvim-lint")
			return
		end
		lint.try_lint()
	end,
})
