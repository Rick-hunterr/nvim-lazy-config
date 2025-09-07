-- ===================================================
-- Telescope y búsqueda
-- ===================================================
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {"nvim-lua/plenary.nvim"},
  cmd = "Telescope",
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup {
      defaults = {
        prompt_prefix = " ❯ ",
        selection_caret = " ▶ ",
        entry_prefix = "   ",
        borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {prompt_position = "bottom", preview_width = 0.55},
          width = 0.87,
          height = 0.80
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<esc>"] = actions.close
          }
        }
      }
    }
    local opts = { noremap = true, silent = true }
    local keymap = vim.keymap.set
    keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
    keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
    keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
    keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
    keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", opts)
    keymap("n", "<leader>fc", "<cmd>Telescope colorscheme<CR>", opts)
  end
}
