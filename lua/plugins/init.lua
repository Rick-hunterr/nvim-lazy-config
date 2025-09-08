-- ===================================================
-- Plugin List - Main Entry Point
-- ===================================================

return {
    -- Load all plugin modules
    { import = "plugins.colorscheme" },
    { import = "plugins.ui" },
    { import = "plugins.editor" },
    { import = "plugins.lsp" },
    { import = "plugins.telescope" },
    { import = "plugins.treesitter" },
    { import = "plugins.git" },
    { import = "plugins.tools" },
}