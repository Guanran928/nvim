local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- completions.lua
  {
    "hrsh7th/nvim-cmp", -- Auto completion
    dependencies = {
      "neovim/nvim-lspconfig",

      -- Snippet Engine & its associated nvim-cmp source
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      -- Adds LSP completion capabilities
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",

      -- Adds a number of user-friendly snippets
      "rafamadriz/friendly-snippets",
    },
  },

  -- lspconfig.lua
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },

  {
    -- I didn't figure out how to use null-ls/none-ls...
    "sbdchd/neoformat",
    init = function()
      -- Prefer Alejandra for Nix files
      vim.g.neoformat_enabled_nix = { "alejandra" }
    end,
    keys = {
      { "<Space>lf", "<cmd>Neoformat<CR>", desc = "Format file" },
    },
  },

  -- nvim-tree.lua
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        adaptive_size = true,
      },
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    keys = {
      { "<Space>e", "<cmd>NvimTreeFindFileToggle<CR>", desc = "File Explorer" },
    },
  },

  -- telescope.lua
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- treesitter.lua
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- misc
  {
    "folke/tokyonight.nvim", -- theme
    lazy = false,
    priority = 1000,
    opts = {},
    init = function()
      vim.cmd([[ colorscheme tokyonight-night ]])
    end,
  },

  {
    "nvim-lualine/lualine.nvim", -- status line
    dependencies = {
      "kyazdani42/nvim-web-devicons", -- for filetype icons
    },
    opts = {
      options = {
        -- disable separators
        section_separators = "",
        component_separators = "",

        -- color scheme
        theme = "tokyonight",
      },
      -- hide filename
      sections = {
        lualine_c = {},
      },
    },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },

  {
    "glepnir/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    opts = {
      lightbulb = {
        virtual_text = false,
      },
    },
    keys = {
      { "<Space>a", "<cmd>Lspsaga code_action<CR>", desc = "Code Action" },
    },
  },

  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      auto_hide = 1,
    },
  },

  { "lewis6991/gitsigns.nvim", opts = {} },
})

-- LSP related
require("plugins.lspconfig") -- utilizes lsp
require("plugins.completions") -- adds completions
require("plugins.treesitter") -- better highlights

-- QoL
require("plugins.telescope") -- file search
