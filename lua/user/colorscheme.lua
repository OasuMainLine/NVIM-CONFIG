local colorscheme = "darkplus"

local status_ok, _ = pcall(vim.cmd, "colorscheme "..colorscheme)

if not status_ok then
  vim.notify("Couldn't import the "..colorscheme.." colorscheme")
  return
end
