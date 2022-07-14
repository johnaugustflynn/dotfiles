local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    })
    print "Installing packer. Close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- reload neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
    -- basics
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"

    -- statusline
    use "nvim-lualine/lualine.nvim"

    -- colorscheme
    use {"catppuccin/nvim", as = "catppuccin"}

    -- autocompletion
    use "hrsh7th/nvim-cmp"                -- the completion plugin
    use "hrsh7th/cmp-buffer"              -- buffer completions
    use "hrsh7th/cmp-path"                -- path completions
    use "hrsh7th/cmp-cmdline"             -- cmdline completions
    use "saadparwaiz1/cmp_luasnip"        -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "windwp/nvim-autopairs"

    -- snippets
    use "L3MON4D3/LuaSnip"                -- snippet engine
    use "rafamadriz/friendly-snippets"    -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig"           -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server nvim-lsp-installer

    -- treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "p00f/nvim-ts-rainbow"
    use "nvim-treesitter/playground"

    -- commenting
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "numToStr/Comment.nvim"

    -- telescope
    use "BurntSushi/ripgrep"
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"

    -- git
    use "lewis6991/gitsigns.nvim"

    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)

