-- remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- better navigation
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- ":Lex 30<CR>"
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>q", ":Bdelete<CR>")

-- resize window with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==")

-- keep pasting same yanked text
vim.keymap.set("v", "p", '"_dP')

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- telescope
vim.keymap.set("n", "<leader>sf", "<cmd>lua require'telescope.builtin'.find_files({hidden=true})<CR>")
-- vim.keymap.set("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>")
vim.keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>sd", "<cmd>Telescope diagnostics<CR>")

-- vim-fugitive
vim.cmd("command! -nargs=1 Gcam :G commit -am <args>")
vim.cmd("command! Gn :G number --column")
vim.cmd("command! -nargs=1 Ga :G number add <args>")

-- run code from nvim
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.py" },
    callback = function() vim.keymap.set("n", "gx", ":!python %<CR>") end,
})
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.lua" },
    callback = function() vim.keymap.set("n", "gx", ":source %<CR>") end,
})
