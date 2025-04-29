return {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate", -- Automatically updates the parsers
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			highlight = {
				enable = true, -- Enable syntax highlighting
			},
			indent = {
				enable = true, -- Enable indentation
			},
			autopairs = {
				enable = true, -- Enable autopairs (optional)
			},
			incremental_selection = {
				enable = true,
			},
		})
	end,
}
