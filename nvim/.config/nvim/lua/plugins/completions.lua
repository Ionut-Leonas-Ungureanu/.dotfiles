return {
	"saghen/blink.cmp",
	dependencies = { 'rafamadriz/friendly-snippets' },
	version = "1.*",
	opts = {
		keymap = { preset = "default",
			['<enter>'] = {'accept', 'fallback'},
			['<escape>'] = {'hide', 'fallback'},
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		signature = { enabled = true },
	},
}
