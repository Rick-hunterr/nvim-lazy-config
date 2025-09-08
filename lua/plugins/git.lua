-- ===================================================
-- Git Integration Plugins
-- ===================================================

return {
    -- Git signs
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "▎" },
                    change = { text = "▎" },
                    delete = { text = "" },
                    topdelete = { text = "" },
                    changedelete = { text = "▎" },
                    untracked = { text = "▎" },
                },
                signs_staged = {
                    add = { text = "▎" },
                    change = { text = "▎" },
                    delete = { text = "" },
                    topdelete = { text = "" },
                    changedelete = { text = "▎" },
                    untracked = { text = "▎" },
                },
                signs_staged_enable = true,
                signcolumn = true,
                numhl = false,
                linehl = false,
                word_diff = false,
                watch_gitdir = {
                    follow_files = true,
                },
                auto_attach = true,
                attach_to_untracked = false,
                current_line_blame = false,
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol",
                    delay = 1000,
                    ignore_whitespace = false,
                },
                current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil,
                max_file_length = 40000,
                preview_config = {
                    border = "rounded",
                    style = "minimal",
                    relative = "cursor",
                    row = 0,
                    col = 1,
                },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns
                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map({ "n", "v" }, "]c", function()
                        if vim.wo.diff then
                            return "]c"
                        end
                        vim.schedule(function()
                            gs.next_hunk()
                        end)
                        return "<Ignore>"
                    end, { expr = true, desc = "Jump to next hunk" })

                    map({ "n", "v" }, "[c", function()
                        if vim.wo.diff then
                            return "[c"
                        end
                        vim.schedule(function()
                            gs.prev_hunk()
                        end)
                        return "<Ignore>"
                    end, { expr = true, desc = "Jump to previous hunk" })

                    -- Actions
                    map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
                    map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
                    map("v", "<leader>hs", function()
                        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                    end, { desc = "Stage hunk" })
                    map("v", "<leader>hr", function()
                        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                    end, { desc = "Reset hunk" })
                    map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
                    map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
                    map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })
                    map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
                    map("n", "<leader>hb", function()
                        gs.blame_line({ full = true })
                    end, { desc = "Blame line" })
                    map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle line blame" })
                    map("n", "<leader>hd", gs.diffthis, { desc = "Diff against index" })
                    map("n", "<leader>hD", function()
                        gs.diffthis("~")
                    end, { desc = "Diff against last commit" })
                    map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle deleted" })

                    -- Text object
                    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
                end,
            })

            -- Custom highlights for cyberpunk theme
            vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#39FF14", bg = "NONE" })
            vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#00FFFF", bg = "NONE" })
            vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#FF00FF", bg = "NONE" })
            vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = "#FFA500", bg = "NONE" })
        end,
    },

    -- Fugitive
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Gedit" },
        ft = { "fugitive" },
        keys = {
            { "<leader>gs", ":Git<CR>", desc = "Git status" },
            { "<leader>gd", ":Gdiffsplit<CR>", desc = "Git diff split" },
            { "<leader>gl", ":Git log<CR>", desc = "Git log" },
            { "<leader>gp", ":Git push<CR>", desc = "Git push" },
            { "<leader>gP", ":Git pull<CR>", desc = "Git pull" },
        },
    },

    -- Advanced Git UI
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
    },

    -- Git conflict resolution
    {
        "akinsho/git-conflict.nvim",
        version = "*",
        config = function()
            require("git-conflict").setup({
                default_mappings = true,
                default_commands = true,
                disable_diagnostics = false,
                list_opener = "copen",
                highlights = {
                    incoming = "DiffAdd",
                    current = "DiffText",
                },
            })

            -- Keymaps for conflict resolution
            vim.keymap.set("n", "<leader>gco", "<Plug>(git-conflict-ours)", { desc = "Choose ours" })
            vim.keymap.set("n", "<leader>gct", "<Plug>(git-conflict-theirs)", { desc = "Choose theirs" })
            vim.keymap.set("n", "<leader>gcb", "<Plug>(git-conflict-both)", { desc = "Choose both" })
            vim.keymap.set("n", "<leader>gc0", "<Plug>(git-conflict-none)", { desc = "Choose none" })
            vim.keymap.set("n", "]x", "<Plug>(git-conflict-prev-conflict)", { desc = "Previous conflict" })
            vim.keymap.set("n", "[x", "<Plug>(git-conflict-next-conflict)", { desc = "Next conflict" })
        end,
    },

    -- Git blame virtual text
    {
        "f-person/git-blame.nvim",
        event = "VeryLazy",
        config = function()
            require("gitblame").setup({
                enabled = false, -- Start disabled
                message_template = " <summary> • <date> • <author>",
                date_format = "%m-%d-%Y %H:%M:%S",
                virtual_text_column = 1,
            })

            vim.keymap.set("n", "<leader>gB", ":GitBlameToggle<CR>", { desc = "Toggle git blame" })

            -- Custom highlight
            vim.api.nvim_set_hl(0, "gitblame", { fg = "#00FFFF", italic = true })
        end,
    },
}