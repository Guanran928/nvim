---@type LazyPluginSpec
return {
  "saghen/blink.cmp",
  version = "*",

  dependencies = {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    dependencies = { "rafamadriz/friendly-snippets" },

    init = function()
      local luasnip = require("luasnip")
      luasnip.filetype_extend("javascriptreact", { "html" })
      luasnip.filetype_extend("typescriptreact", { "html" })
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  opts = {
    keymap = { preset = "enter" },
    snippets = { preset = "luasnip" },
    completion = { list = { selection = { preselect = false } } },
    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },
  },
}
