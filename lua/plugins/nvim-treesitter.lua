return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "nix",
      "lua",
      "vim",
    },

    sync_install = true,
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
