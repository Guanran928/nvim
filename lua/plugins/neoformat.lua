return {
  "sbdchd/neoformat",
  init = function()
    -- Basic formatting
    vim.g.neoformat_basic_format_retab = 1
    vim.g.neoformat_basic_format_trim = 1

    -- Prefer Alejandra for Nix files
    vim.g.neoformat_enabled_nix = { "alejandra" }
  end,
  keys = {
    { "<Space>lf", "<cmd>Neoformat<CR>", desc = "Format file" },
  },
}
