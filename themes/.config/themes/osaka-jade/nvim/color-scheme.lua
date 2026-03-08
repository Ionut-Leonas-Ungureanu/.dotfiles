return {
  "ribru17/bamboo.nvim",
  priority = 1000,
  config = function()
    require("bamboo").setup({
			transparent = true,
	})

	require("lualine").setup({
		options = {
			theme = 'bamboo'
		}
	})

    -- Apply the colorscheme
    vim.cmd.colorscheme("bamboo")
  end,
}
