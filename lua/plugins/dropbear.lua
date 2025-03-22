---@type LazyPluginSpec
return {
  "Bekaboo/dropbar.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  event = {
    "BufRead",
    "BufNewFile",
  },
}
