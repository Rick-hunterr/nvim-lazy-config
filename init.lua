-- ===================================================
-- Init.lua Cyberpunk Neon - Neovim 0.10+
-- ===================================================

-- Instala Lazy.nvim si no está presente
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,})
end
vim.opt.rtp:prepend(lazypath)

-- Carga la configuración modular
require("config")
