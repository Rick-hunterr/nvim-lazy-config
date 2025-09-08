-- ===================================================
-- Global Keymaps Configuration
-- ===================================================

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
keymap("n", "<leader>ba", ":%bd|e#<CR>", { desc = "Delete all buffers except current" })

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- File operations
keymap("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap("n", "<leader>x", ":x<CR>", { desc = "Save and quit" })
keymap("n", "<leader>Q", ":qa!<CR>", { desc = "Force quit all" })

-- Split windows
keymap("n", "<leader>sv", ":vsplit<CR>", { desc = "Vertical split" })
keymap("n", "<leader>sh", ":split<CR>", { desc = "Horizontal split" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Equal splits" })
keymap("n", "<leader>sx", ":close<CR>", { desc = "Close split" })

-- System clipboard
keymap({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to clipboard" })
keymap("n", "<leader>Y", '"+Y', { desc = "Copy line to clipboard" })
keymap({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })

-- Clear search highlights
keymap("n", "<Esc>", ":noh<CR>", opts)

-- Better navigation
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Quick fix list
keymap("n", "<leader>co", ":copen<CR>", { desc = "Open quickfix" })
keymap("n", "<leader>cc", ":cclose<CR>", { desc = "Close quickfix" })
keymap("n", "<leader>cn", ":cnext<CR>", { desc = "Next quickfix" })
keymap("n", "<leader>cp", ":cprev<CR>", { desc = "Previous quickfix" })

-- Toggle options
keymap("n", "<leader>uw", function()
    vim.wo.wrap = not vim.wo.wrap
    print("Wrap: " .. tostring(vim.wo.wrap))
end, { desc = "Toggle wrap" })

keymap("n", "<leader>ur", function()
    vim.wo.relativenumber = not vim.wo.relativenumber
    print("Relative numbers: " .. tostring(vim.wo.relativenumber))
end, { desc = "Toggle relative numbers" })



-- ===================================================
-- Agregar al archivo config/keymaps.lua
-- ===================================================

-- Force clear search highlights (override default behavior)
keymap("n", "<Esc>", function()
    vim.cmd("nohlsearch")
    return "<Esc>"
end, { expr = true, desc = "Clear highlights and escape" })

-- Clear highlights with leader key
keymap("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Disable * and # auto-highlighting (visual feedback without persistent highlighting)
keymap("n", "*", function()
    vim.cmd("normal! *")
    vim.defer_fn(function()
        vim.cmd("nohlsearch")
    end, 100)
end, { desc = "Search word forward (no persistent highlight)" })

keymap("n", "#", function()
    vim.cmd("normal! #")
    vim.defer_fn(function()
        vim.cmd("nohlsearch")
    end, 100)
end, { desc = "Search word backward (no persistent highlight)" })