-- ===================================================
-- Neovim Options Configuration
-- ===================================================

local opt = vim.opt
local g = vim.g

-- UI Configuration
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.linebreak = true
opt.list = false
opt.fillchars = {
    eob = " ",
    fold = " ",
    foldopen = "v",
    foldsep = " ",
    foldclose = ">",
}

-- Editor behavior
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- System
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.swapfile = false
opt.backup = false
opt.updatetime = 50
opt.timeoutlen = 300
opt.completeopt = "menuone,noselect,noinsert"

-- Window transparency
opt.pumblend = 10
opt.winblend = 10

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Performance
opt.lazyredraw = false
opt.redrawtime = 1500

-- Disable some built-in plugins for better startup time
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit",
    "python3_provider",
    "node_provider",
    "perl_provider",
    "ruby_provider",
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

-- Disable matchparen plugin (highlights matching parentheses)
g.loaded_matchparen = 1