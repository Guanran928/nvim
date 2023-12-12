vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.keymap.set("n", "<c-n>", ":NvimTreeFindFileToggle<CR>")

require("nvim-tree").setup({
  view = {
    adaptive_size = true,
  },
})
