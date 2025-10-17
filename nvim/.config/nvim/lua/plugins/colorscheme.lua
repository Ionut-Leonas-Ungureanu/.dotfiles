return {
  "neanias/everforest-nvim",
  priority = 1000,
  config = function()
    require("everforest").setup({
		-- transparent = true,
		-- styles = {
		-- 	sidebars = "transparent",
		-- 	floats = "transparent",
		-- }
	})

    -- Apply the colorscheme
    vim.cmd.colorscheme("everforest")
  end,
}
