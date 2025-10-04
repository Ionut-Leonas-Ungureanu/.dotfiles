return {
  "mason-org/mason.nvim",
  opts = {
    registries = {
      "github:mason-org/mason-registry",
      "github:Crashdummyy/mason-registry",
    },
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
      -- needs to be manually installed
      "roslyn",
    },
  },
}
