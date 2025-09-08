-- ===================================================
-- Neovim Configuration - Cyberpunk Theme
-- Author: Bits Hunter  
-- Version: 2.0 (Lazy.nvim)
-- ===================================================

-- PASO 1: Definir leader keys INMEDIATAMENTE
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- PASO 2: Cargar lazy DESPUÉS de definir leader keys
require("config.lazy")

-- PASO 3: Cargar configuración del core AL FINAL
require("config").setup() -- Llamar explícitamente a setup()