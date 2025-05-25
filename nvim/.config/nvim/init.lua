vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.o.relativenumber = true
vim.o.number = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.virtualedit = "block"
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.scrolloff = 10
vim.o.mouse = "a"
vim.o.breakindent = true
vim.o.undofile = true
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmode = false

-- scheduled to reduce startup-time
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- [[ Keymaps ]]
--
-- clear search highlight on <Esc> in normal mode
vim.o.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- familiar delete word
vim.keymap.set("i", "<C-BS>", "<C-W>")

-- quickfix navigation
vim.keymap.set("n", "[q", "<cmd>cprev<CR>", { silent = true })
vim.keymap.set("n", "]q", "<cmd>cnext<CR>", { silent = true })

-- Diagnostics
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next [D]iagnostic message" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- tmux-like split
vim.keymap.set("n", "<C-w>%", "<cmd>vsplit<CR>")
vim.keymap.set("n", '<C-w>"', "<cmd>split<CR>", { silent = true })

-- Lazy
require("config.lazy")
