return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local telescope = require('telescope.builtin')
			vim.keymap.set('n', '<C-p>', telescope.find_files, {desc = 'Telescope find files' })
			vim.keymap.set('n', '<S-f>', telescope.live_grep, {desc = 'Telscope live grep' })
		end
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown{}
					}
				}
			})
			require("telescope").load_extension("ui-select")
		end
	}
}
