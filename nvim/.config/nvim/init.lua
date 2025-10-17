-- https://github.com/nanotee/nvim-lua-guide

vim.opt.colorcolumn= "121"

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

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv")

-- close neo-tree at :q
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local api = vim.api
    local wins = api.nvim_list_wins()
    if #wins == 1 then
      local buf = api.nvim_get_current_buf()
      local ft = api.nvim_get_option_value("filetype", { buf = buf })
      if ft == "neo-tree" then
        vim.cmd("quit")
      end
    end
  end,
  desc = "Auto-close if Neo-tree is the last window",
})


-- lazy plugin manager
require("config.lazy")
