return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    view = {
      adaptive_size = true,
    },
  },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  keys = {
    { "<Space>e", "<cmd>NvimTreeFindFileToggle<CR>", desc = "File Explorer" },
  },
}
