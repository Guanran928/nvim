-- Better file reading
vim.opt.autoread = true
vim.opt.autowrite = true

-- Cursorline
vim.opt.cursorline = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Mouse
vim.cmd([[   
  aunmenu PopUp.How-to\ disable\ mouse
  aunmenu PopUp.-1-
]])
vim.opt.mouse = "a"

-- Scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- System integration
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.undofile = true

-- Tab settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Visuals
vim.opt.laststatus = 3
vim.opt.showmode = false -- Handled by lualine
vim.opt.signcolumn = "yes" -- Prevents shifting

-- Neovide specific settings
if vim.g.neovide then
  vim.opt.guifont = "monospace:h12"

  -- Terminal-emulator-like copy/pasting
  vim.api.nvim_set_keymap("n", "<C-C>", '"+y', { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<C-V>", '"+p', { noremap = true, silent = true })
end
