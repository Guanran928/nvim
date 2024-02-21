return {
  "sbdchd/neoformat",
  init = function()
    -- Prefer Alejandra for Nix files
    vim.g.neoformat_enabled_nix = { "alejandra" }
  end,
  keys = {
    { "<Space>lf", "<cmd>Neoformat<CR>", desc = "Format file" },
  },
}
