return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvimtools/none-ls-extras.nvim", "jay-babu/mason-null-ls.nvim" },
	config = function()
		require("mason-null-ls").setup({
			ensure_installed = {
				"shfmt",
				"stylua",
				"prettier",
				"csharpier",
				"clang_format",
				"spell",
				--"eslint_d",
				"cpplint",
			},
		})

		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.csharpier,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.completion.spell,
				--require("none-ls.diagnostics.eslint_d"),
				require("none-ls.diagnostics.cpplint"),
			},
		})

	end,
}
