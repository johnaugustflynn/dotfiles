vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if status_ok then
    nvim_tree.setup()
end

local outline_ok, outline = pcall(require, "outline")
if outline_ok then
    outline.setup()
end

local bufferline_ok, bufferline = pcall(require, "bufferline")
if bufferline_ok then
    bufferline.setup()
end

local comment_ok, comment = pcall(require, "Comment")
if comment_ok then
    comment.setup()
end

local _, _ = pcall(vim.cmd, "colorscheme tokyonight")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

local lualine_ok, lualine = pcall(require, "lualine")
if lualine_ok then
    lualine.setup {
        options = {
            disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "toggleterm" }
        }
    }
end

require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "jaf.plugins"
require "jaf.options"
require "jaf.keymaps"
require "jaf.gitsigns"
require "jaf.toggleterm"
