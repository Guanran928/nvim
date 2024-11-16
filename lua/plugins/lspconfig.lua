return {
  "neovim/nvim-lspconfig",
  init = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities() -- needed for nvim-cmp

    require("lspconfig").lua_ls.setup({
      capabilities = capabilities,
    })

    require("lspconfig").ruff.setup({
      capabilities = capabilities,
    })

    require("lspconfig").nil_ls.setup({
      capabilities = capabilities,
    })

    require("lspconfig").gopls.setup({
      capabilities = capabilities,
    })
  end,
}
