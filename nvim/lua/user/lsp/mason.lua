local mason_ok, mason = pcall(require, "mason")
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")

if not (mason_ok and lspconfig_ok and mason_lspconfig_ok) then
    return
end

local servers = {
    "bashls",
    "clangd",
    "cssls",
    "gopls",
    "html",
    "jsonls",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "tsserver",
}

mason.setup()
mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
})

for _, server in pairs(servers) do
    local opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    if server == "lua_ls" then
        opts.settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },
        }
    end

    if server == "jsonls" then
        opts.settings = {
            json = {
                schemas = require("user.lsp.jsonschemas"),
            },
        }
        opts.setup = {
            commands = {
                Format = {
                    function()
                        vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
                    end,
                },
            },
        }
    end

    lspconfig[server].setup(opts)
end
