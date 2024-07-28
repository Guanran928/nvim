return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.alejandra,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
      },
    })
  end,
  keys = {
    {
      "<leader>lf",
      function()
        vim.lsp.buf.format()
      end,
      desc = "Format file",
    },
    {
      "<leader>a",
      function()
        vim.lsp.buf.code_action()
      end,
      desc = "Code action",
    },
  },
}
