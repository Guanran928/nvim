---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "comment",
      "diff",
      "html",
      "lua",
      "luadoc",
      "markdown",
      "nix",
      "vim",
      "vimdoc",
    },

    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.install").prefer_git = true
    require("nvim-treesitter.configs").setup(opts)
    require("telescope").load_extension("fzf")
  end,
}
