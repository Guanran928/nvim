return {
  "nvim-lualine/lualine.nvim", -- status line
  dependencies = {
    "kyazdani42/nvim-web-devicons", -- for filetype icons
  },
  opts = {
    options = {
      -- disable separators
      section_separators = "",
      component_separators = "",
    },
    -- hide filename
    sections = {
      lualine_c = {},
    },
  },
}
