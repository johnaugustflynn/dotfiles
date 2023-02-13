local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup {
    open_mapping = [[<c-\>]],
    direction = "vertical",
    size = vim.o.columns * 0.4
}
