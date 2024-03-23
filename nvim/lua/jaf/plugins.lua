-- bootstrap packer automatically
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- -- use a protected call so we don't error out on first use
-- local status_ok, packer = pcall(require, "packer")
-- if not status_ok then
--     return
-- end
--
-- -- have packer use a popup window
-- packer.init {
--   display = {
--     open_fn = function()
--       return require("packer.util").float { border = "rounded" }
--     end,
--   },
-- }

return require("packer").startup(function(use)
    -- dependencies
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "kyazdani42/nvim-web-devicons"

    -- file explorer
    use "kyazdani42/nvim-tree.lua"
    use {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function() require('dashboard').setup() end,
        requires = {'nvim-tree/nvim-web-devicons'}
    }

    -- code navigation
    use "hedyhli/outline.nvim"

    -- buffers
    use "akinsho/bufferline.nvim"           -- "tabs"
    use "moll/vim-bbye"                     -- better buffer closing

    -- statusline
    use "nvim-lualine/lualine.nvim"

    -- colorschemes
    use {"catppuccin/nvim", as = "catppuccin"}
    use "folke/tokyonight.nvim"
    use "ellisonleao/gruvbox.nvim"
    use 'navarasu/onedark.nvim'

    -- autocompletion
    use "hrsh7th/nvim-cmp"                  -- the completion plugin
    use "hrsh7th/cmp-buffer"                -- buffer completions
    use "hrsh7th/cmp-path"                  -- path completions
    use "hrsh7th/cmp-cmdline"               -- cmdline completions
    use "saadparwaiz1/cmp_luasnip"          -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "windwp/nvim-autopairs"

    -- snippets
    use "L3MON4D3/LuaSnip"                  -- snippet engine
    use "rafamadriz/friendly-snippets"      -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig"             -- enable LSP
    use "williamboman/mason.nvim"           -- manage language tooling
    use "williamboman/mason-lspconfig.nvim"
    use "jose-elias-alvarez/null-ls.nvim"   -- for formatters and linters

    -- treesitter
    use "nvim-treesitter/nvim-treesitter" --, run = ":TSUpdate" }

    -- commenting
    use "numToStr/Comment.nvim"

    -- telescope
    use "BurntSushi/ripgrep"
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"

    -- git
    use "tpope/vim-fugitive"
    use "lewis6991/gitsigns.nvim"

    -- terminal
    use { "akinsho/toggleterm.nvim", tag = "v2.*" }

    if packer_bootstrap then
        require("packer").sync()
    end
end)

