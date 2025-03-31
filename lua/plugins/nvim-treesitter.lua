---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
  lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
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
  end,
}
