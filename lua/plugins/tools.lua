-- ===================================================
-- Additional Tools and Utilities
-- ===================================================

return {
    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        keys = {
            { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
            { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float terminal" },
            { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal terminal" },
            { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical terminal" },
        },
        config = function()
            require("toggleterm").setup({
                size = 20,
                open_mapping = [[<C-\>]],
                hide_numbers = true,
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                insert_mappings = true,
                persist_size = true,
                direction = "float",
                close_on_exit = true,
                shell = vim.o.shell,
                float_opts = {
                    border = "curved",
                    winblend = 10,
                    highlights = {
                        border = "FloatBorder",
                        background = "NormalFloat",
                    },
                    width = function()
                        return math.floor(vim.o.columns * 0.8)
                    end,
                    height = function()
                        return math.floor(vim.o.lines * 0.8)
                    end,
                },
            })

            -- Terminal keymaps
            function _G.set_terminal_keymaps()
                local opts = { buffer = 0 }
                vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
                vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
                vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
                vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
                vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
                vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
            end

            -- Auto-apply terminal keymaps
            vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

            -- Custom highlights
            vim.api.nvim_set_hl(0, "ToggleTermBorder", { fg = "#FF00FF", bg = "NONE" })
        end,
    },

    -- File manager (ranger-like)
    {
        "kevinhwang91/rnvimr",
        cmd = "RnvimrToggle",
        keys = {
            { "<leader>r", "<cmd>RnvimrToggle<cr>", desc = "Toggle Ranger" },
        },
        config = function()
            vim.g.rnvimr_ex_enable = 1
            vim.g.rnvimr_pick_enable = 1
            vim.g.rnvimr_draw_border = 1
            vim.g.rnvimr_bw_enable = 1
        end,
    },

    -- Session management
    {
        "rmagatti/auto-session",
        dependencies = {
            "rmagatti/session-lens",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("auto-session").setup({
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
                auto_session_use_git_branch = false,
                auto_session_enable_last_session = false,
                auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
                auto_session_enabled = true,
                auto_save_enabled = nil,
                auto_restore_enabled = nil,
                auto_session_create_enabled = nil,
                session_lens = {
                    buftypes_to_ignore = {},
                    load_on_setup = true,
                    theme_conf = { border = true },
                    previewer = false,
                },
            })

            -- Keymap corregido para session-lens
            vim.keymap.set("n", "<leader>ls", function()
                require("session-lens").search_session()
            end, {
                noremap = true,
                desc = "Search sessions",
            })
        end,
    },

    -- Rest Client
    {
        "rest-nvim/rest.nvim",
        ft = { "http", "rest" },
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            rocks = {
                -- Deshabilita hererocks para evitar el error de instalación.
                hererocks = false
            }
        },
        keys = {
            { "<leader>rr", "<cmd>RestNvim<cr>", desc = "Run REST request" },
            { "<leader>rp", "<cmd>RestNvimPreview<cr>", desc = "Preview REST request" },
            { "<leader>rl", "<cmd>RestNvimLast<cr>", desc = "Run last REST request" },
        },
    },

    -- Markdown preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        keys = {
            { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
        },
        config = function()
            vim.cmd([[do FileType]])
        end,
    },

    -- Better quickfix
    {
        "kevinhwang91/nvim-bqf",
        ft = "qf",
        config = function()
            require("bqf").setup({
                auto_enable = true,
                auto_resize_height = true,
                preview = {
                    win_height = 12,
                    win_vheight = 12,
                    delay_syntax = 80,
                    border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
                    should_preview_cb = function(bufnr, qwinid)
                        local ret = true
                        local bufname = vim.api.nvim_buf_get_name(bufnr)
                        local fsize = vim.fn.getfsize(bufname)
                        if fsize > 100 * 1024 then
                            ret = false
                        end
                        return ret
                    end,
                },
                func_map = {
                    vsplit = "",
                    ptogglemode = "z,",
                    stoggleup = "",
                },
                filter = {
                    fzf = {
                        action_for = { ["ctrl-s"] = "split" },
                        extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
                    },
                },
            })
        end,
    },

    -- Database interface
    {
        "tpope/vim-dadbod",
        opt = true,
        dependencies = {
            "kristijanhusak/vim-dadbod-ui",
            "kristijanhusak/vim-dadbod-completion",
        },
        config = function()
            require("config.dadbod").setup()
        end,
        cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
    },

    -- Code runner
    {
        "CRAG666/code_runner.nvim",
        config = function()
            require("code_runner").setup({
                mode = "term",
                focus = false,
                startinsert = false,
                term = {
                    position = "bot",
                    size = 8,
                },
                float = {
                    border = "rounded",
                    height = 0.8,
                    width = 0.8,
                    x = 0.5,
                    y = 0.5,
                    border_hl = "FloatBorder",
                    float_hl = "Normal",
                    blend = 0,
                },
                filetype = {
                    java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
                    python = "python3 -u",
                    typescript = "deno run",
                    rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
                    c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
                    cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
                    javascript = "node",
                    go = "go run",
                    lua = "lua",
                    sh = "bash",
                },
            })
        end,
        keys = {
            { "<leader>rf", ":RunCode<CR>", desc = "Run code" },
            { "<leader>rt", ":RunFile tab<CR>", desc = "Run file in tab" },
            { "<leader>rp", ":RunProject<CR>", desc = "Run project" },
            { "<leader>rc", ":RunClose<CR>", desc = "Close runner" },
        },
    },

    -- Zen mode
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        keys = {
            { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
        },
        config = function()
            require("zen-mode").setup({
                window = {
                    backdrop = 0.95,
                    width = 120,
                    height = 1,
                    options = {
                        signcolumn = "no",
                        number = false,
                        relativenumber = false,
                        cursorline = false,
                        cursorcolumn = false,
                        foldcolumn = "0",
                        list = false,
                    },
                },
                plugins = {
                    options = {
                        enabled = true,
                        ruler = false,
                        showcmd = false,
                    },
                    twilight = { enabled = true },
                    gitsigns = { enabled = false },
                    tmux = { enabled = false },
                },
            })
        end,
    },

    -- Dim inactive portions of code
    {
        "folke/twilight.nvim",
        cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
        config = function()
            require("twilight").setup({
                dimming = {
                    alpha = 0.25,
                    color = { "Normal", "#ffffff" },
                    term_bg = "#000000",
                    inactive = false,
                },
                context = 10,
                treesitter = true,
                expand = {
                    "function",
                    "method",
                    "table",
                    "if_statement",
                },
                exclude = {},
            })
        end,
    },

    -- Motion plugin
    {
        "ggandor/leap.nvim",
        keys = {
            { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
            { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
            { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
        },
        config = function(_, opts)
            local leap = require("leap")
            for k, v in pairs(opts) do
                leap.opts[k] = v
            end
            leap.add_default_mappings(true)
            vim.keymap.del({ "x", "o" }, "x")
            vim.keymap.del({ "x", "o" }, "X")
        end,
    },

    -- Measures startup time
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },

    -- Better folding
    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        event = "VeryLazy",
        opts = {
            provider_selector = function()
                return { "treesitter", "indent" }
            end,
        },
        init = function()
            vim.o.foldcolumn = "1"
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true
        end,
        config = function(_, opts)
            require("ufo").setup(opts)
            vim.keymap.set("n", "zR", require("ufo").openAllFolds)
            vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
        end,
    },
}