return {
  { -- bootstrap Lua LSP to understand neovim APIs
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {"lua", "vim"},
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true},
      })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require("nvim-tree").setup()
      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
    end,
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup {}
      vim.keymap.set("n", "<leader>sf", "<cmd>FzfLua files<CR>")
      vim.keymap.set("n", "<leader>sg", "<cmd>FzfLua grep<CR>")
    end
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup {
        -- open_mapping = "[[C-\]]",
        -- direction = "vertical",
        -- size = vim.o.columns * 0.4
      }
    end,
  },
  {
    "cbochs/grapple.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", lazy = true }
    },
    config = function()
      local grapple = require("grapple")
      vim.keymap.set("n", "<leader>m", grapple.toggle)
      vim.keymap.set("n", "<leader>M", grapple.toggle_tags)
      vim.keymap.set("n", "<leader>1", "<cmd>Grapple select index=1<CR>")
    end
  },
}
