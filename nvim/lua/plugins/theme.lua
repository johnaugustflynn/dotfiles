return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme gruvbox]])
      vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup {
        shortcut_type = "number",
      }
    end,
    dependencies = { {"nvim-tree/nvim-web-devicons"} }
  },
  {
    "hedyhli/outline.nvim",
    config = function()
      require("outline").setup {}
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle [o]utline" })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { {"nvim-tree/nvim-web-devicons"} },
    config = function()
      require("lualine").setup {
        options = {
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "toggleterm" },
        }
      }
    end,
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup {}
      vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>" )
      vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>" )
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup {
        exclude = { filetypes = { "dashboard" } },
      }
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function() require("gitsigns").setup {} end,
  },
}
