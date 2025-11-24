return {
	"nvim-neotest/neotest",
	dependencies = {
		"Issafalcon/neotest-dotnet",
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter"
	},
	config = function()
		local neotest = require("neotest").setup({
			adapters = {
				require("neotest-dotnet")({
					dap = { justMyCode = false },
				})
			}
		})

		vim.keymap.set("n", "<leader>td", function()
			require("neotest").run.run()
		end)

		vim.keymap.set("n", "<leader>td", function()
			require("neotest").run.run({ strategy = "dap" })
		end)

	end,
}
