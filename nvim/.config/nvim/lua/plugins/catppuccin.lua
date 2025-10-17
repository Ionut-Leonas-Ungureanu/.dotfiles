return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- make sure it loads before other UI plugins
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato also available
      transparent_background = false,
      integrations = {
        treesitter = true,
        lualine = false,
        -- telescope = true, etc.
      },
    })

    -- Apply the colorscheme
    vim.cmd.colorscheme("catppuccin")
  end,
}
