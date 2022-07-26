local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

-- local branch = {
-- 	"branch",
-- 	icons_enabled = true,
-- 	icon = "",
-- }
--
-- local spaces = function()
-- 	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end

lualine.setup {
    options = {
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    }
}
