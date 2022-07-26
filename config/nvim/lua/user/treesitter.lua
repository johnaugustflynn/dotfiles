local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    ensure_installed = { "python" }, -- A list of parser names, or "all"
    sync_install = false,            -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" },         -- List of parsers to ignore installing
    highlight = {
      enable = true,                 -- false will disable the whole extension
      disable = { "" },              -- list of language that will be disabled
      additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },
    autopairs = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    }
}

