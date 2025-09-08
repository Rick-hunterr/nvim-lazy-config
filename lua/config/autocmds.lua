-- ===================================================
-- Autocommands Configuration
-- ===================================================

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
    group = augroup("highlight_yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
    group = augroup("remove_trailing_whitespace", { clear = true }),
    pattern = "*",
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

-- Set filetype specific options
autocmd("FileType", {
    group = augroup("filetype_options", { clear = true }),
    pattern = { "lua", "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "jsonc" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
    end,
})

-- Terminal settings
autocmd("TermOpen", {
    group = augroup("term_settings", { clear = true }),
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
        vim.cmd("startinsert")
    end,
})

-- Auto resize splits when window is resized
autocmd("VimResized", {
    group = augroup("resize_splits", { clear = true }),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- Go to last location when opening a file
autocmd("BufReadPost", {
    group = augroup("last_location", { clear = true }),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Check if file changed outside of vim
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    group = augroup("checktime", { clear = true }),
    command = "if mode() != 'c' | checktime | endif",
})

-- Create directories when saving a file
autocmd("BufWritePre", {
    group = augroup("auto_create_dir", { clear = true }),
    callback = function(event)
        if event.match:match("^%w%w+://") then
            return
        end
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})



-- ===================================================
-- Agregar al archivo config/autocmds.lua
-- ===================================================

-- Clear search highlight when entering insert mode
autocmd("InsertEnter", {
    group = augroup("clear_search_highlight", { clear = true }),
    callback = function()
        vim.cmd("nohlsearch")
    end,
})

-- Prevent automatic highlighting of word under cursor
autocmd("CursorMoved", {
    group = augroup("no_cursor_highlight", { clear = true }),
    callback = function()
        vim.cmd("nohlsearch")
    end,
})

-- Clear highlights when switching buffers
autocmd("BufEnter", {
    group = augroup("clear_highlights_on_buffer_change", { clear = true }),
    callback = function()
        vim.cmd("nohlsearch")
    end,
})
