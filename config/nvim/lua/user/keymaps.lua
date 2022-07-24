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
vim.keymap.set("n", "<leader>q", ":Bdelete<CR>")

-- terminal
vim.keymap.set("n", "<leader>py", ":lua _IPYTHON_TOGGLE()<CR>")

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

-- telescope
vim.keymap.set("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files({hidden=true})<cr>")
-- vim.keymap.set("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>")
vim.keymap.set("n", "<leader>g", "<cmd>Telescope live_grep<cr>")

