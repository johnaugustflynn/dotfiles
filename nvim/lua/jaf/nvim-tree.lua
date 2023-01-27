local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

nvim_tree.setup {
    view = {
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
                { key = "v", cb = require("nvim-tree.config").nvim_tree_callback "vsplit" },
            }
        }
    }
}

