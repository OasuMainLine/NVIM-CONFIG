local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
  vim.notify("Couldn't find bufferline")
  return
end


bufferline.setup(
  {
    options = {
      diagnostics = "nvim_lsp",
    }
  }
)
