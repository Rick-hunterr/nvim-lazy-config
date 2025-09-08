-- ===================================================
-- Telescope Configuration
-- ===================================================

return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        version = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "folke/trouble.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                config = function()
                    require("telescope").load_extension("fzf")
                end,
            },
        },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
            { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
            { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
            { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Grep string" },
            { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
            { "<leader>fw", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current buffer fuzzy find" },
            { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
            { "<leader>fl", "<cmd>Telescope loclist<cr>", desc = "Location list" },
            { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Marks" },
            { "<leader>fj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
            { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects" },
            -- Git
            { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
            { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
            { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
            { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Git files" },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local trouble = require("trouble.providers.telescope")

            telescope.setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    entry_prefix = "  ",
                    initial_mode = "insert",
                    selection_strategy = "reset",
                    sorting_strategy = "ascending",
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.55,
                            results_width = 0.8,
                        },
                        vertical = {
                            mirror = false,
                        },
                        width = 0.87,
                        height = 0.80,
                        preview_cutoff = 120,
                    },
                    file_ignore_patterns = {
                        "%.git/",
                        "node_modules/",
                        "%.npm/",
                        "__pycache__/",
                        "%.pyc",
                        "%.pyo",
                        "%.o",
                        "%.a",
                        "%.out",
                        "%.pdf",
                        "%.mkv",
                        "%.mp4",
                        "%.zip",
                        "%.tar.gz",
                        "%.class",
                        "%.jar",
                        "%.dll",
                        "%.exe",
                    },
                    winblend = 0,
                    border = {},
                    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                    color_devicons = true,
                    use_less = true,
                    path_display = { "truncate" },
                    set_env = { ["COLORTERM"] = "truecolor" },
                    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
                    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
                    mappings = {
                        i = {
                            ["<C-n>"] = actions.cycle_history_next,
                            ["<C-p>"] = actions.cycle_history_prev,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-c>"] = actions.close,
                            ["<Down>"] = actions.move_selection_next,
                            ["<Up>"] = actions.move_selection_previous,
                            ["<CR>"] = actions.select_default,
                            ["<C-x>"] = actions.select_horizontal,
                            ["<C-v>"] = actions.select_vertical,
                            ["<C-t>"] = actions.select_tab,
                            ["<C-u>"] = actions.preview_scrolling_up,
                            ["<C-d>"] = actions.preview_scrolling_down,
                            ["<PageUp>"] = actions.results_scrolling_up,
                            ["<PageDown>"] = actions.results_scrolling_down,
                            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                            ["<C-l>"] = actions.complete_tag,
                            ["<C-_>"] = actions.which_key,
                            ["<c-t>"] = trouble.open_with_trouble,
                        },
                        n = {
                            ["<esc>"] = actions.close,
                            ["<CR>"] = actions.select_default,
                            ["<C-x>"] = actions.select_horizontal,
                            ["<C-v>"] = actions.select_vertical,
                            ["<C-t>"] = actions.select_tab,
                            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                            ["j"] = actions.move_selection_next,
                            ["k"] = actions.move_selection_previous,
                            ["H"] = actions.move_to_top,
                            ["M"] = actions.move_to_middle,
                            ["L"] = actions.move_to_bottom,
                            ["<Down>"] = actions.move_selection_next,
                            ["<Up>"] = actions.move_selection_previous,
                            ["gg"] = actions.move_to_top,
                            ["G"] = actions.move_to_bottom,
                            ["<C-u>"] = actions.preview_scrolling_up,
                            ["<C-d>"] = actions.preview_scrolling_down,
                            ["<PageUp>"] = actions.results_scrolling_up,
                            ["<PageDown>"] = actions.results_scrolling_down,
                            ["?"] = actions.which_key,
                            ["<c-t>"] = trouble.open_with_trouble,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        theme = "dropdown",
                        previewer = false,
                        hidden = true,
                        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                    },
                    live_grep = {
                        theme = "ivy",
                        only_sort_text = true,
                    },
                    grep_string = {
                        theme = "ivy",
                        only_sort_text = true,
                    },
                    buffers = {
                        theme = "dropdown",
                        previewer = false,
                        initial_mode = "normal",
                        mappings = {
                            i = {
                                ["<C-d>"] = actions.delete_buffer,
                            },
                            n = {
                                ["dd"] = actions.delete_buffer,
                            },
                        },
                    },
                    colorscheme = {
                        enable_preview = true,
                    },
                    lsp_references = {
                        theme = "ivy",
                        initial_mode = "normal",
                    },
                    lsp_definitions = {
                        theme = "ivy",
                        initial_mode = "normal",
                    },
                    lsp_declarations = {
                        theme = "ivy",
                        initial_mode = "normal",
                    },
                    lsp_implementations = {
                        theme = "ivy",
                        initial_mode = "normal",
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                },
            })

            -- Load extensions
            pcall(telescope.load_extension, "fzf")

            -- Custom highlights for cyberpunk theme
            vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#FF00FF", bg = "NONE" })
            vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#00FFFF", bg = "NONE" })
            vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#FF00FF", bg = "NONE", bold = true })
            vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#39FF14", bg = "NONE", bold = true })
            vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = "#FFA500", bg = "NONE", bold = true })
            vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = "#FF00FF", bg = "#1a1b26", bold = true })
            vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = "#FF00FF", bold = true })
            vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = "#FF00FF", bold = true })
            vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#00FFFF", bold = true })
        end,
    },

    -- Projects extension
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup({
                detection_methods = { "lsp", "pattern" },
                patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
                ignore_lsp = {},
                exclude_dirs = {},
                show_hidden = false,
                silent_chdir = true,
                scope_chdir = "global",
                datapath = vim.fn.stdpath("data"),
            })
            require("telescope").load_extension("projects")
        end,
    },
}