-- nvimtree requires these set first
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require "jaf.plugins"
require "jaf.options"
require "jaf.keymaps"

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

local gitsigns_ok, gitsigns = pcall(require, "gitsigns")
if gitsigns_ok then
    gitsigns.setup {
        signs = {
            add          = { hl = "GitSignsAdd",    text = "▎",  numhl = "GitSignsAddNr",    linehl = "GitSignsAddLn" },
            change       = { hl = "GitSignsChange", text = "▎",  numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
            delete       = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
            topdelete    = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
            changedelete = { hl = "GitSignsChange", text = "▎",  numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        }
    }
end

local term_ok, toggleterm = pcall(require, "toggleterm")
if term_ok then
    toggleterm.setup {
        open_mapping = [[<c-\>]],
        -- direction = "vertical",
        -- size = vim.o.columns * 0.4
    }
end

-- TODO: rewrite for myself
-- copied from neovim-from-scratch
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
