return {
  'numToStr/Comment.nvim',
  "lambdalisue/suda.vim",
  'norcalli/nvim-colorizer.lua',
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        signs = false,
        highlight = {
          pattern = [[.*(KEYWORDS)\s*(\(.*\))?\s*:]],
        },
        search = {
          pattern = [[\b(KEYWORDS)\s*(\(.*\))?\s*:]],
        },
      }
    end
  },
  {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
  },
  {
    "ggandor/leap.nvim",
    config = function() require("leap").set_default_keymaps() end
  },
}
