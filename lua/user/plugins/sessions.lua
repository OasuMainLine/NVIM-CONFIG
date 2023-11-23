local status_ok, sessions = pcall(require, "sessions")

if not status_ok then
  vim.notify("Couldn't find sessions")
  return
end


local sessions_opts = {
  events = {"VimLeavePre", "BufReadPre", "BufWritePre", "BufWinLeave"},
  session_filepath = vim.fn.stdpath("data") .. "/sessions",
  absolute = true
}

sessions.setup(sessions_opts)
