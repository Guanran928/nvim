-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better file reading
vim.opt.autoread = true
vim.opt.autowrite = true

-- Cursorline
vim.opt.cursorline = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Breakindent
vim.opt.breakindent = true

-- Mouse
vim.cmd([[
  aunmenu PopUp.How-to\ disable\ mouse
  aunmenu PopUp.-2-
]])
vim.opt.mouse = "a"

-- Scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- System integration
-- https://github.com/nvim-lua/kickstart.nvim/blob/7201dc480134f41dd1be1f8f9b8f8470aac82a3b/init.lua#L113-L119
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)
vim.opt.swapfile = false
vim.opt.undofile = true

-- Tab settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Visuals
vim.opt.laststatus = 3
vim.opt.cmdheight = 0 -- Remove gap between lualine and tmux
vim.opt.signcolumn = "yes" -- Prevents shifting
vim.opt.fillchars = { eob = " " } -- Remove tilde on empty lines

-- Restore cursor after exit
-- https://codeberg.org/dnkl/foot/issues/1891#issuecomment-2557228
vim.api.nvim_create_autocmd("VimLeave", {
  pattern = "*",
  callback = function()
    vim.opt.guicursor = ""
    vim.fn.chansend(vim.v.stderr, "\x1b[ q")
  end,
})

vim.diagnostic.config({
  virtual_text = {
    -- HACK: There is a space before the diagnostic text for some
    --       reason, therefore putting another space at the end of the
    --       diagnostic text to center it.
    prefix = "",
    suffix = " ",
    virt_text_pos = "eol_right_align",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
  },
})

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { silent = true, desc = "Show diagnostics" })
