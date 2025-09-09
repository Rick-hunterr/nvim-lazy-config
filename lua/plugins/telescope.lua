-- ===================================================
-- Telescope Configuration
-- ===================================================

return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "folke/trouble.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
            {
                "ahmedkhalf/project.nvim",
            },
            {
                "nvim-telescope/telescope-file-browser.nvim",
            },
        },
        
        -- Key mappings
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
            -- File Browser
            { "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
        },
        
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            
            -- Check if trouble is available before using it
            local trouble_available, trouble = pcall(require, "trouble.providers.telescope")
            if not trouble_available then
                trouble = nil
            end

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
                    file_browser = {
                        previewer = true,
                        theme = "ivy",
                        hijack_netrw = true,
                    },
                },
            })

            -- Load extensions with error handling
            pcall(telescope.load_extension, "fzf")
            pcall(telescope.load_extension, "projects")
            pcall(telescope.load_extension, "file_browser")

            -- Add trouble integration if available
            if trouble_available then
                local function add_trouble_mappings()
                    local i_mappings = telescope.config.defaults.mappings.i or {}
                    local n_mappings = telescope.config.defaults.mappings.n or {}
                    
                    i_mappings["<c-t>"] = trouble.open_with_trouble
                    n_mappings["<c-t>"] = trouble.open_with_trouble
                end
                
                pcall(add_trouble_mappings)
            end

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
    
    -- Optional: Session management with auto-session (more stable alternative)
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
                auto_session_enable_last_session = false,
                auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
                auto_session_enabled = true,
                auto_save_enabled = nil,
                auto_restore_enabled = nil,
                auto_session_use_git_branch = nil,
            })
            
            -- Session management keymaps
            vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<cr>", { desc = "Save Session" })
            vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<cr>", { desc = "Restore Session" })
            vim.keymap.set("n", "<leader>sd", "<cmd>SessionDelete<cr>", { desc = "Delete Session" })
            vim.keymap.set("n", "<leader>ft", "<cmd>Telescope session-lens search_session<cr>", { desc = "Find Sessions" })
        end,
        keys = {
            { "<leader>ss", "<cmd>SessionSave<cr>", desc = "Save Session" },
            { "<leader>sr", "<cmd>SessionRestore<cr>", desc = "Restore Session" },
            { "<leader>sd", "<cmd>SessionDelete<cr>", desc = "Delete Session" },
            { "<leader>ft", "<cmd>Telescope session-lens search_session<cr>", desc = "Find Sessions" },
        },
    },
}