---@type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  dependencies = { "saghen/blink.cmp" },
  config = function()
    local servers = {
      "gopls",
      "lua_ls",
      "nil_ls",
      "pyright",
      "rust_analyzer",
      "tailwindcss",
      "ts_ls",
    }

    for _, lsp in pairs(servers) do
      vim.lsp.enable(lsp)
    end
  end,
}
