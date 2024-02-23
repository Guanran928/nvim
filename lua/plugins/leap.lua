return {
  "ggandor/leap.nvim",
  dependencies = {
    "tpope/vim-repeat",
  },
  opts = {},
  init = function()
    require('leap').create_default_mappings()
  end,
}
