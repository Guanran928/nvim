return {
  -- maintained fork of "norcalli/nvim-colorizer.lua"
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    user_default_options = {
      names = false,
      tailwind = true,
      mode = "virtualtext",
      virtualtext_inline = "before",
    },
  },
}
