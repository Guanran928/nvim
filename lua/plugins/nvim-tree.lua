return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    view = {
      side = "right",
    },
    renderer = {
      symlink_destination = false, -- usually too long
    },
  },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  keys = {
    { "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", desc = "File Explorer" },
  },
}
