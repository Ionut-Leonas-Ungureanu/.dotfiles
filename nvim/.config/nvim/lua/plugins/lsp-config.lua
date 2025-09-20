return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				}
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"html",
					"cssls",
					"bashls",
					"roslyn"
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			-- local pid = vim.fn.getpid()

			vim.lsp.config('lua_ls', {capabilities = capabilities})
			vim.lsp.config('clangd', { capabilities = capabilities })
			-- vim.lsp.config('ts_ls', { capabilities = capabilities })
			vim.lsp.config('html', { capabilities = capabilities })
			vim.lsp.config('cssls', { capabilities = capabilities })
			vim.lsp.config('bashls', { capabilities = capabilities })

			-- Angular
			vim.lsp.config('angularls', {
				cmd = { "ngserver", "--stdio", "--tsProbeLocations", "../..,?/node_modules", "--ngProbeLocations", "../../@angular/language-server/node_modules,?/node_modules/@angular/language-server/node_modules", "--angularCoreVersion", "" },
				filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
				root_markers = { "angular.json", "nx.json" },
				capabilities = capabilities,
			})

			-- C#
			vim.lsp.config("roslyn", { capabilities = capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
