---@type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },
  init = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })

    lspconfig.pyright.setup({
      capabilities = capabilities,
    })

    lspconfig.nil_ls.setup({
      capabilities = capabilities,
    })

    lspconfig.gopls.setup({
      capabilities = capabilities,
    })

    lspconfig.ts_ls.setup({
      capabilities = capabilities,
    })

    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
    })
  end,
}
