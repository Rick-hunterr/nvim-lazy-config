-- ===================================================
-- Configuración de Lazy.nvim
-- ===================================================

require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
  dev = {
    -- Si tienes plugins locales, defínelos aquí
  },
})
