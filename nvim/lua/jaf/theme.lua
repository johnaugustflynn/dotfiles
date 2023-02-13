local colorscheme = "gruvbox"

local color_cmd = "colorscheme " .. colorscheme .. " | hi Normal guibg=NONE ctermbg=NONE"
local color_ok, _ = pcall(vim.cmd, color_cmd)
if not color_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
end

local lualine_ok, lualine = pcall(require, "lualine")
if lualine_ok then
    lualine.setup {
        options = {
            disabled_filetypes = {
                "alpha",
                "dashboard",
                "NvimTree",
                "Outline",
                "toggleterm",
            },
            theme = colorscheme
        }
    }
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

return
