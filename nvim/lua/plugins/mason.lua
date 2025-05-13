return {
  {
    "mason-org/mason.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      require("mason").setup {}
      require("mason-lspconfig").setup {}
      
      local servers = {
        "lua-language-server",
        "bashls",
        "clangd",
        "pyright",
        "jsonls",
        "html",
        "cssls",
        "ts_ls",
      }

      require("mason-tool-installer").setup {
        ensure_installed = servers,
      }

      vim.lsp.config("*", { root_markers = {".git"} })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          -- DEFAULT KEYMAPS: https://neovim.io/doc/user/lsp.html#lsp-defaults
          -- "grn" is mapped in Normal mode to vim.lsp.buf.rename()
          -- "gra" is mapped in Normal and Visual mode to vim.lsp.buf.code_action()
          -- "grr" is mapped in Normal mode to vim.lsp.buf.references()
          -- "gri" is mapped in Normal mode to vim.lsp.buf.implementation()
          -- "gO" is mapped in Normal mode to vim.lsp.buf.document_symbol()
          -- CTRL-S is mapped in Insert mode to vim.lsp.buf.signature_help()
          map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")

          -- turn of default inline diagnostics
          vim.diagnostic.config({
            virtual_text = false,
            float = {
              header = false,
              border = "rounded"
            }
          })

          local opts = { noremap = true, silent = true }
          vim.api.nvim_set_keymap("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>", opts)
          vim.api.nvim_set_keymap( "n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
          vim.api.nvim_set_keymap( "n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)

        end
      })

    end
  },
}
