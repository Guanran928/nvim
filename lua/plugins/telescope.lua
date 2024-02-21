return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    { "<Space>f", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<Space><Space>", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
    { "<Space>sg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
  },
}
