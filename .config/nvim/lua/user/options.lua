-- see :help options
local options = {
    -- general
    fileencoding = "utf-8",

    -- editor behavior
    expandtab = true,
    shiftwidth = 4,
    undofile = true,
    
    -- editor view
    cursorline = true,
    number = true,
    cmdheight = 2,
    --doiwant? guifont = "monospace:h17", 

    -- make buffer windows nicer
    splitbelow = true,
    splitright = true,
    scrolloff = 8,
    sidescrolloff = 8,
    wrap = false,
    mouse = "a",

    -- speed stuff up
    timeoutlen = 1000,
    updatetime = 300,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

