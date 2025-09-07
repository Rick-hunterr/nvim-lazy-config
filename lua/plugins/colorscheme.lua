-- ===================================================
-- Tema y colores
-- ===================================================
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = false, bold = true },
        functions = { bold = true },
        variables = {},
        sidebars = "transparent",
        floats = "transparent"
      },
      sidebars = {"qf", "help", "nvim-tree", "terminal"},
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = true
    })

    vim.cmd [[colorscheme tokyonight-night]]

    -- Personalización extrema cyberpunk con transparencia
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE', ctermbg = 'NONE' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE', ctermbg = 'NONE' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#FF00FF', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'LineNr', { fg = '#39FF14', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#FF00FF', bg = 'NONE', bold = true })
    vim.api.nvim_set_hl(0, 'Comment', { fg = '#00FFFF', italic = true })
    vim.api.nvim_set_hl(0, 'Function', { fg = '#FF00FF', bold = true })
    vim.api.nvim_set_hl(0, 'String', { fg = '#39FF14' })
    vim.api.nvim_set_hl(0, 'Keyword', { fg = '#00FFFF', bold = true })
    vim.api.nvim_set_hl(0, 'Type', { fg = '#FFA500' })
    vim.api.nvim_set_hl(0, 'Identifier', { fg = '#FF1493' })
    vim.api.nvim_set_hl(0, 'AlphaHeader', { fg = '#FF00FF', bold = true })
    vim.api.nvim_set_hl(0, 'AlphaButtons', { fg = '#00FFFF', bold = true })
    vim.api.nvim_set_hl(0, 'AlphaFooter', { fg = '#39FF14', italic = true })
    vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = '#FF00FF', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = '#00FFFF', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = '#39FF14', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { fg = '#FFA500', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#1a1b26', fg = '#FF00FF', bold = true })
    vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = '#FF00FF' })
    vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = '#FF00FF' })
    vim.api.nvim_set_hl(0, 'NvimTreeFolderName', { fg = '#00FFFF' })
    vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderName', { fg = '#39FF14', bold = true })
    vim.api.nvim_set_hl(0, 'NvimTreeGitDirty', { fg = '#FFA500' })
    vim.api.nvim_set_hl(0, 'NvimTreeGitNew', { fg = '#39FF14' })
    vim.api.nvim_set_hl(0, 'NvimTreeGitDeleted', { fg = '#FF0000' })
    vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#FF0000' })
    vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '#FFA500' })
    vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '#00FFFF' })
    vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#39FF14' })
    vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#39FF14' })
    vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#00FFFF' })
    vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#FF00FF' })
    vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#1a1b26' })
    vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = '#FF00FF' })
    vim.api.nvim_set_hl(0, 'IlluminateWord', { underline = true, fg = '#FF00FF', bg = '#2a2b36' })
  end
}
