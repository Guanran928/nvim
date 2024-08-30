return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Portable package manager
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  init = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities() -- needed for nvim-cmp
    require("mason").setup()
    require("mason-lspconfig").setup()

    -- lspconfig
    require("lspconfig").lua_ls.setup({
      capabilities = capabilities,
    })

    require("lspconfig").pyright.setup({
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
