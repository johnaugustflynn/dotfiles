local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

nvim_tree.setup {
    view = {
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
                { key = "v", cb = nvim_tree_config.nvim_tree_callback "vsplit" },
            }
        }
    }
}

