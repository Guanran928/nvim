---@type LazyPluginSpec
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      nix = { "nixfmt" },
      python = { "ruff" },

      html = { "prettier" },
      css = { "prettier" },
      less = { "prettier" },
      scss = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      vue = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
    },

    format_on_save = {
      lsp_format = "fallback",
      async = true,
    },
  },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ lsp_format = "fallback", async = true })
      end,
      desc = "Format file",
    },
  },
}
