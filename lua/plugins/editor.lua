-- ===================================================
-- Funcionalidades del editor
-- ===================================================
return {
  -- Explorador de archivos
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    cmd = {"NvimTreeToggle", "NvimTreeFindFile"},
    config = function()
      require('nvim-tree').setup {
        view = {
          width = 30,
          side = 'left'
        },
        renderer = {
          group_empty = true,
          highlight_git = true,
          highlight_opened_files = "all",
          icons = {
            glyphs = {
              default = "",
              symlink = "",
              folder = {
                arrow_closed = "▶",
                arrow_open = "▼",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = ""
              }
            }
          }
        },
        git = {
          enable = true,
          ignore = false,
          signs = {
            add = {"│", "GitSignsAdd"},
            change = {"│", "GitSignsChange"},
            delete = {" ", "GitSignsDelete"},
            untracked = {"│", "GitSignsAdd"},
            ignore = {" ", "NvimTreeGitIgnored"}
          }
        }
      }
      vim.keymap.set('n', '<leader>e', ":NvimTreeToggle<CR>", { desc = 'Toggle NvimTree' })
    end
  },

  -- Terminal flotante
  {
    "akinsho/toggleterm.nvim",
    tag = '*',
    cmd = "ToggleTerm",
    config = function()
      require("toggleterm").setup {
        size = 20,
        open_mapping = [[<c-\>]],
        direction = 'float',
        shade_terminals = false,
        float_opts = {
          border = 'double',
          winblend = 15,
          highlights = {
            border = "FloatBorder",
            background = "NormalFloat"
          }
        }
      }
    end
  },

  -- Comentarios
  {
    "numToStr/Comment.nvim",
    keys = { "gcc" },
    config = function()
      require('Comment').setup()
    end
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require('nvim-autopairs').setup {}
    end
  },

  -- Indent lines
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    config = function()
      require("ibl").setup {
        indent = {
          char = "▏"
        },
        scope = {
          enabled = true,
          show_start = false,
          show_end = false
        }
      }
    end
  },

  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function()
      require('colorizer').setup()
    end
  },
}
