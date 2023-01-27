local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup {
    open_mapping = [[<C-\>]],
    direction = "float",
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
                border = "Normal",
                background = "Normal",
        },
    },
}

local Terminal = require("toggleterm.terminal").Terminal

function _IPYTHON_TOGGLE()
	Terminal:new({ cmd = "ipython", hidden = true }):toggle()
end
