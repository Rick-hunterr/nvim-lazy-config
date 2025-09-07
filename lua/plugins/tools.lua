-- ===================================================
-- Herramientas adicionales
-- ===================================================
return {
  -- Resaltar palabra bajo el cursor
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function()
      require('illuminate').configure({
        delay = 200,
        min_len_each_group = 1
      })
    end,
    -- Desactivar el resaltado de la palabra bajo el cursor por defecto
    init = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                if not vim.g.no_illuminate then
                    require("illuminate").on_buf_enter({
                        bufnr = args.buf,
                    })
                end
            end,
        })
        -- Comando para activar/desactivar illuminate
        vim.api.nvim_create_user_command("ToggleIlluminate", function()
            vim.g.no_illuminate = not vim.g.no_illuminate
            if vim.g.no_illuminate then
                vim.cmd("IlluminatePause")
            else
                vim.cmd("IlluminateResume")
            end
        end, { desc = "Toggle vim-illuminate" })
    end
  },

  -- Vista de contorno del documento (Outline)
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    config = function()
      require("symbols-outline").setup({
        -- Aquí puedes personalizar la configuración del plugin
      })
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<leader>o", "<cmd>SymbolsOutline<CR>", opts)
    end
  }
}
