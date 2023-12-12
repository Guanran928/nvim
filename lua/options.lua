vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.opt.tabstop = 2
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.wo.number = true
vim.wo.signcolumn = "yes"
vim.o.undofile = true
vim.o.clipboard = "unnamedplus"

vim.cmd([[ set noswapfile ]])

-- Neovide
-- Put anything you want to happen only in Neovide here
if vim.g.neovide then
  vim.o.guifont = "monospace:h12"
  vim.g.neovide_padding_top = 12
  vim.g.neovide_padding_bottom = 12
  vim.g.neovide_padding_right = 12
  vim.g.neovide_padding_left = 12

  -- Terminal-emulator-like copy/pasting
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_set_keymap
  keymap("n", "<C-C>", '"*y :let @+=@*<CR>', opts)
  keymap("n", "<C-V>", '"+p', opts)
end
