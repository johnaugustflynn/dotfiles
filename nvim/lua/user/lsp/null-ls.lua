local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
    debug = false,
    sources = {
        --[[ formatting.stylua, ]]
        formatting.black.with { extra_args = { "--fast" } },
        formatting.isort.with { extra_args = { "--profile",  "black" } },
        formatting.jq,
        diagnostics.pylint,
    },
}
