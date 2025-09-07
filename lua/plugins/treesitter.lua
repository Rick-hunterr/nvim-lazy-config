-- ===================================================
-- Syntax highlighting
-- ===================================================
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {"lua", "vim", "python", "javascript", "typescript", "rust", "go"},
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
      },
      indent = {
        enable = true
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil
      }
    }
  end
}
