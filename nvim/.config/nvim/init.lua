-- https://github.com/nanotee/nvim-lua-guide

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

vim.g.mapleader = " "

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
})

-- lazy plugin manager
require("config.lazy")

