return {
  "neanias/everforest-nvim",
  priority = 1000,
  config = function()
    require("everforest").setup({
			transparent_background_level=1,
	})

    -- Apply the colorscheme
    vim.cmd.colorscheme("everforest")
  end,
}
