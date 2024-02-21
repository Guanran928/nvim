-- Better file reading
vim.opt.autoread = true
vim.opt.autowrite = true

-- Line number
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true

-- Mouse
vim.cmd([[   
  aunmenu PopUp.How-to\ disable\ mouse
  aunmenu PopUp.-1-
]])
vim.opt.mouse = "a"

-- System integration
vim.cmd([[ set noswapfile ]])
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true

-- Tab
vim.opt.expandtab = true
vim.opt.tabstop = 2

-- Visuals
vim.opt.laststatus = 3
vim.opt.showmode = false -- we already have lualine
vim.opt.signcolumn = "yes" -- so it doesn't shift around

-- Neovide
if vim.g.neovide then
  vim.o.guifont = "monospace:h12"

  -- Terminal-emulator-like copy/pasting
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_set_keymap
  keymap("n", "<C-C>", '"*y :let @+=@*<CR>', opts)
  keymap("n", "<C-V>", '"+p', opts)
end
