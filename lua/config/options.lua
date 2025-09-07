-- ===================================================
-- Opciones básicas del editor
-- ===================================================

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.mouse = 'a'
opt.termguicolors = true
opt.cursorline = true
opt.scrolloff = 8
opt.updatetime = 50
opt.signcolumn = 'yes'
opt.wrap = false
opt.clipboard = 'unnamedplus'
opt.completeopt = 'menuone,noselect'
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.hlsearch = false
opt.incsearch = true

-- Opciones para transparencia
opt.pumblend = 20
opt.winblend = 20
