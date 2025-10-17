return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	opts = {
		keymap = {
			preset = "default",
			--["<enter>"] = { "accept", "fallback" },
			--["<escape>"] = { "hide", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		signature = { enabled = true },
		completion = {
			-- Disable auto brackets
			-- NOTE: some LSPs may add auto brackets themselves anyway
			-- accept = { auto_brackets = { enabled = false } },

			-- Don't select by default, auto insert on selection
			list = { selection = { preselect = false, auto_insert = true } },

			menu = {
				-- Don't automatically show the completion menu
				-- auto_show = false,

				-- nvim-cmp style menu
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
					},
				},
			},

			-- Show documentation when selecting a completion item
			documentation = { auto_show = true },

			-- Display a preview of the selected item on the current line
			-- ghost_text = { enabled = true },
		},
		sources = {
			-- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
}
