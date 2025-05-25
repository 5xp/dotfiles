return {
	"rose-pine/neovim",
	priority = 1000,
	name = "rose-pine",
	styles = {
		italic = false,
	},
	config = function()
		vim.cmd("colorscheme rose-pine")
	end,
}
