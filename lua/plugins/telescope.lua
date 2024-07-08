return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {},
  cmd = "Telescope",
  keys = {
    { "<leader>f", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader><leader>", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
    { "<leader>sg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
  },
}
