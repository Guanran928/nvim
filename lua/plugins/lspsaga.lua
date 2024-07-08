return {
  "glepnir/lspsaga.nvim",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
  opts = {
    lightbulb = {
      virtual_text = false,
    },
  },
  keys = {
    { "<leader>a", "<cmd>Lspsaga code_action<CR>", desc = "Code Action" },
  },
}
