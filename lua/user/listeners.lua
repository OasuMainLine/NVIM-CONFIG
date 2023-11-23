
local subscribe = vim.api.nvim_create_autocmd

local function onBufRead()
  local status_ok, sessions = pcall(require, "sessions")
  if not status_ok then
     vim.notify("Couldn't load sessions")
     return
  end

  local status_ok, _ = pcall(sessions.load, ".nvim/sessions")
  if not status_ok then
    vim.notify("No session")
    return
  end
end


