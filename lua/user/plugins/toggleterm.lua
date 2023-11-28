local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  vim.notify("Couldn't load toggleterm")
  return
end


local toggle_term_opts = {
  open_mapping = "<leader>t",
  direction = "vertical",
  insert_mappings = false,
  size = function(term)
    if term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end

}
toggleterm.setup(toggle_term_opts)
