---@type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  dependencies = { "saghen/blink.cmp" },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    local lspconfig = require("lspconfig")

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
      lspconfig[lsp].setup({
        capabilities = capabilities,
      })
    end
  end,
}
