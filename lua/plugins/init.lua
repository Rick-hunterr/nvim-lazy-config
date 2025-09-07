-- ===================================================
-- Lista de plugins y su configuración
-- ===================================================

return {
  -- Importa los plugins desde archivos separados
  require("plugins.colorscheme"),
  require("plugins.ui"),
  require("plugins.editor"),
  require("plugins.lsp"),
  require("plugins.telescope"),
  require("plugins.treesitter"),
  require("plugins.git"),
  require("plugins.tools"),
}
