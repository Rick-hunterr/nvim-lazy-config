-- ===================================================
-- Complete Cyberpunk Color Scheme Configuration
-- Actualizar plugins/colorscheme.lua completamente
-- ===================================================

return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "night",
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = false, bold = true },
                    functions = { bold = true },
                    variables = {},
                    sidebars = "transparent",
                    floats = "transparent",
                },
                sidebars = { "qf", "help", "terminal", "packer", "nvim-tree", "neo-tree", "Outline" },
                hide_inactive_statusline = false,
                dim_inactive = false,
                lualine_bold = true,
                
                -- Custom cyberpunk colors
                on_colors = function(colors)
                    -- Core cyberpunk palette
                    colors.bg = "NONE"
                    colors.bg_dark = "NONE"
                    colors.bg_float = "NONE"
                    colors.bg_highlight = "#1a1a2e"
                    colors.bg_popup = "#16213e"
                    colors.bg_search = "#0f3460"
                    colors.bg_sidebar = "NONE"
                    colors.bg_statusline = "NONE"
                    colors.bg_visual = "#533c7d"
                    
                    -- Neon colors
                    colors.fg = "#e6e6e6"
                    colors.fg_dark = "#c0c0c0"
                    colors.fg_gutter = "#39FF14"
                    colors.fg_sidebar = "#c0c0c0"
                    
                    -- Accent colors
                    colors.blue = "#00BFFF"
                    colors.cyan = "#00FFFF"
                    colors.green = "#39FF14"
                    colors.magenta = "#FF00FF"
                    colors.orange = "#FFA500"
                    colors.pink = "#FF1493"
                    colors.purple = "#9D4EDD"
                    colors.red = "#FF0040"
                    colors.yellow = "#FFFF00"
                    
                    -- Special colors
                    colors.git = {
                        add = "#39FF14",
                        change = "#00FFFF",
                        delete = "#FF00FF",
                        ignore = "#545c7e",
                    }
                    
                    colors.gitSigns = {
                        add = "#39FF14",
                        change = "#00FFFF", 
                        delete = "#FF00FF",
                    }
                end,
                
                on_highlights = function(hl, c)
                    -- Base editor highlights
                    hl.Normal = { bg = "NONE", fg = c.fg }
                    hl.NormalFloat = { bg = "NONE", fg = c.fg }
                    hl.NormalNC = { bg = "NONE", fg = c.fg_dark }
                    hl.SignColumn = { bg = "NONE", fg = c.fg_gutter }
                    hl.MsgArea = { bg = "NONE", fg = c.fg }
                    hl.ModeMsg = { bg = "NONE", fg = c.cyan, bold = true }
                    hl.MsgSeparator = { bg = "NONE", fg = c.magenta }
                    hl.SpellBad = { sp = c.red, undercurl = true }
                    hl.SpellCap = { sp = c.yellow, undercurl = true }
                    hl.SpellLocal = { sp = c.blue, undercurl = true }
                    hl.SpellRare = { sp = c.purple, undercurl = true }
                    
                    -- Cursor and lines
                    hl.Cursor = { bg = c.magenta, fg = c.bg }
                    hl.lCursor = { bg = c.magenta, fg = c.bg }
                    hl.CursorIM = { bg = c.magenta, fg = c.bg }
                    hl.CursorColumn = { bg = c.bg_highlight }
                    hl.CursorLine = { bg = c.bg_highlight }
                    hl.LineNr = { fg = c.green, bg = "NONE" }
                    hl.CursorLineNr = { fg = c.magenta, bg = "NONE", bold = true }
                    hl.ColorColumn = { bg = c.bg_highlight }
                    
                    -- Selection and search
                    hl.Visual = { bg = c.bg_visual }
                    hl.VisualNOS = { bg = c.bg_visual }
                    hl.Search = { bg = c.bg_search, fg = c.fg }
                    hl.IncSearch = { bg = c.orange, fg = c.bg }
                    hl.CurSearch = { bg = c.orange, fg = c.bg }
                    hl.Substitute = { bg = c.red, fg = c.bg }
                    
                    -- Popup menus
                    hl.Pmenu = { bg = c.bg_popup, fg = c.fg }
                    hl.PmenuSel = { bg = c.magenta, fg = c.bg, bold = true }
                    hl.PmenuSbar = { bg = c.bg_highlight }
                    hl.PmenuThumb = { bg = c.cyan }
                    
                    -- Borders and separators
                    hl.FloatBorder = { fg = c.magenta, bg = "NONE" }
                    hl.FloatTitle = { fg = c.cyan, bg = "NONE", bold = true }
                    hl.WinSeparator = { fg = c.magenta, bg = "NONE" }
                    hl.VertSplit = { fg = c.magenta, bg = "NONE" }
                    
                    -- Syntax highlighting
                    hl.Comment = { fg = c.cyan, italic = true }
                    hl.Constant = { fg = c.orange }
                    hl.String = { fg = c.green }
                    hl.Character = { fg = c.green }
                    hl.Number = { fg = c.orange }
                    hl.Boolean = { fg = c.orange }
                    hl.Float = { fg = c.orange }
                    hl.Identifier = { fg = c.pink }
                    hl.Function = { fg = c.magenta, bold = true }
                    hl.Statement = { fg = c.cyan, bold = true }
                    hl.Conditional = { fg = c.cyan, bold = true }
                    hl.Repeat = { fg = c.cyan, bold = true }
                    hl.Label = { fg = c.pink }
                    hl.Operator = { fg = c.cyan }
                    hl.Keyword = { fg = c.cyan, bold = true }
                    hl.Exception = { fg = c.red, bold = true }
                    hl.PreProc = { fg = c.pink }
                    hl.Include = { fg = c.pink }
                    hl.Define = { fg = c.pink }
                    hl.Macro = { fg = c.pink }
                    hl.PreCondit = { fg = c.pink }
                    hl.Type = { fg = c.yellow }
                    hl.StorageClass = { fg = c.yellow }
                    hl.Structure = { fg = c.yellow }
                    hl.Typedef = { fg = c.yellow }
                    hl.Special = { fg = c.pink }
                    hl.SpecialChar = { fg = c.pink }
                    hl.Tag = { fg = c.pink }
                    hl.Delimiter = { fg = c.fg }
                    hl.SpecialComment = { fg = c.cyan, italic = true }
                    hl.Debug = { fg = c.red }
                    hl.Underlined = { fg = c.blue, underline = true }
                    hl.Ignore = { fg = c.bg }
                    hl.Error = { fg = c.red, bold = true }
                    hl.Todo = { fg = c.yellow, bg = "NONE", bold = true }
                    
                    -- Diagnostics
                    hl.DiagnosticError = { fg = c.red }
                    hl.DiagnosticWarn = { fg = c.orange }
                    hl.DiagnosticInfo = { fg = c.cyan }
                    hl.DiagnosticHint = { fg = c.green }
                    hl.DiagnosticUnnecessary = { fg = c.fg_dark, italic = true }
                    hl.DiagnosticUnderlineError = { sp = c.red, undercurl = true }
                    hl.DiagnosticUnderlineWarn = { sp = c.orange, undercurl = true }
                    hl.DiagnosticUnderlineInfo = { sp = c.cyan, undercurl = true }
                    hl.DiagnosticUnderlineHint = { sp = c.green, undercurl = true }
                    
                    -- LSP
                    hl.LspReferenceText = { bg = c.bg_highlight }
                    hl.LspReferenceRead = { bg = c.bg_highlight }
                    hl.LspReferenceWrite = { bg = c.bg_highlight }
                    hl.LspSignatureActiveParameter = { bg = c.bg_highlight, bold = true }
                    hl.LspCodeLens = { fg = c.cyan, italic = true }
                    hl.LspCodeLensSeparator = { fg = c.cyan }
                    
                    -- Telescope
                    hl.TelescopeNormal = { bg = "NONE", fg = c.fg }
                    hl.TelescopeBorder = { fg = c.magenta, bg = "NONE" }
                    hl.TelescopePromptNormal = { bg = "NONE", fg = c.fg }
                    hl.TelescopePromptBorder = { fg = c.cyan, bg = "NONE" }
                    hl.TelescopePromptTitle = { fg = c.magenta, bg = "NONE", bold = true }
                    hl.TelescopePreviewTitle = { fg = c.green, bg = "NONE", bold = true }
                    hl.TelescopeResultsTitle = { fg = c.orange, bg = "NONE", bold = true }
                    hl.TelescopeSelection = { fg = c.magenta, bg = c.bg_highlight, bold = true }
                    hl.TelescopeSelectionCaret = { fg = c.magenta, bold = true }
                    hl.TelescopePromptPrefix = { fg = c.magenta, bold = true }
                    hl.TelescopeMatching = { fg = c.cyan, bold = true }
                    hl.TelescopeMultiSelection = { fg = c.orange, bold = true }
                    
                    -- Neo-tree
                    hl.NeoTreeNormal = { bg = "NONE", fg = c.fg }
                    hl.NeoTreeNormalNC = { bg = "NONE", fg = c.fg_dark }
                    hl.NeoTreeDirectoryIcon = { fg = c.magenta }
                    hl.NeoTreeDirectoryName = { fg = c.cyan }
                    hl.NeoTreeFileName = { fg = c.fg }
                    hl.NeoTreeFileNameOpened = { fg = c.green, bold = true }
                    hl.NeoTreeIndentMarker = { fg = c.bg_highlight }
                    hl.NeoTreeRootName = { fg = c.magenta, bold = true }
                    hl.NeoTreeSymbolicLinkTarget = { fg = c.cyan, italic = true }
                    hl.NeoTreeGitAdded = { fg = c.git.add }
                    hl.NeoTreeGitConflict = { fg = c.red }
                    hl.NeoTreeGitDeleted = { fg = c.git.delete }
                    hl.NeoTreeGitIgnored = { fg = c.git.ignore }
                    hl.NeoTreeGitModified = { fg = c.git.change }
                    hl.NeoTreeGitUnstaged = { fg = c.orange }
                    hl.NeoTreeGitUntracked = { fg = c.yellow }
                    hl.NeoTreeGitStaged = { fg = c.green }
                    
                    -- Git Signs
                    hl.GitSignsAdd = { fg = c.gitSigns.add, bg = "NONE" }
                    hl.GitSignsChange = { fg = c.gitSigns.change, bg = "NONE" }
                    hl.GitSignsDelete = { fg = c.gitSigns.delete, bg = "NONE" }
                    hl.GitSignsAddNr = { fg = c.gitSigns.add, bg = "NONE" }
                    hl.GitSignsChangeNr = { fg = c.gitSigns.change, bg = "NONE" }
                    hl.GitSignsDeleteNr = { fg = c.gitSigns.delete, bg = "NONE" }
                    hl.GitSignsAddLn = { fg = c.gitSigns.add, bg = "NONE" }
                    hl.GitSignsChangeLn = { fg = c.gitSigns.change, bg = "NONE" }
                    hl.GitSignsDeleteLn = { fg = c.gitSigns.delete, bg = "NONE" }
                    
                    -- Bufferline
                    hl.BufferLineFill = { bg = "NONE" }
                    hl.BufferLineBackground = { fg = c.fg_dark, bg = "NONE" }
                    hl.BufferLineBufferSelected = { fg = c.magenta, bg = "NONE", bold = true, italic = false }
                    hl.BufferLineBufferVisible = { fg = c.cyan, bg = "NONE" }
                    hl.BufferLineCloseButton = { fg = c.fg_dark, bg = "NONE" }
                    hl.BufferLineCloseButtonVisible = { fg = c.cyan, bg = "NONE" }
                    hl.BufferLineCloseButtonSelected = { fg = c.magenta, bg = "NONE" }
                    hl.BufferLineIndicatorSelected = { fg = c.magenta, bg = "NONE" }
                    hl.BufferLineModified = { fg = c.orange, bg = "NONE" }
                    hl.BufferLineModifiedSelected = { fg = c.green, bg = "NONE" }
                    hl.BufferLineModifiedVisible = { fg = c.orange, bg = "NONE" }
                    hl.BufferLineSeparator = { fg = c.bg_highlight, bg = "NONE" }
                    hl.BufferLineSeparatorSelected = { fg = c.bg_highlight, bg = "NONE" }
                    hl.BufferLineSeparatorVisible = { fg = c.bg_highlight, bg = "NONE" }
                    hl.BufferLineTab = { fg = c.fg_dark, bg = "NONE" }
                    hl.BufferLineTabSelected = { fg = c.magenta, bg = "NONE", bold = true }
                    hl.BufferLineTabClose = { fg = c.red, bg = "NONE" }
                    hl.BufferLineDuplicate = { fg = c.fg_dark, bg = "NONE", italic = true }
                    hl.BufferLineDuplicateSelected = { fg = c.magenta, bg = "NONE", bold = true, italic = true }
                    hl.BufferLineDuplicateVisible = { fg = c.cyan, bg = "NONE", italic = true }
                    
                    -- Lualine
                    hl.lualine_a_normal = { bg = c.magenta, fg = c.bg, bold = true }
                    hl.lualine_a_insert = { bg = c.cyan, fg = c.bg, bold = true }
                    hl.lualine_a_visual = { bg = c.green, fg = c.bg, bold = true }
                    hl.lualine_a_command = { bg = c.orange, fg = c.bg, bold = true }
                    hl.lualine_a_replace = { bg = c.red, fg = c.bg, bold = true }
                    hl.lualine_b_normal = { bg = "NONE", fg = c.cyan }
                    hl.lualine_c_normal = { bg = "NONE", fg = c.green }
                    
                    -- IndentBlankline
                    hl.IblIndent = { fg = c.bg_highlight, nocombine = true }
                    hl.IblScope = { fg = c.magenta, nocombine = true }
                    
                    -- Nvim-cmp
                    hl.CmpItemAbbr = { fg = c.fg }
                    hl.CmpItemAbbrDeprecated = { fg = c.fg_dark, strikethrough = true }
                    hl.CmpItemAbbrMatch = { fg = c.cyan, bold = true }
                    hl.CmpItemAbbrMatchFuzzy = { fg = c.cyan, bold = true }
                    hl.CmpItemKind = { fg = c.pink }
                    hl.CmpItemKindText = { fg = c.green }
                    hl.CmpItemKindMethod = { fg = c.blue }
                    hl.CmpItemKindFunction = { fg = c.blue }
                    hl.CmpItemKindConstructor = { fg = c.blue }
                    hl.CmpItemKindField = { fg = c.orange }
                    hl.CmpItemKindVariable = { fg = c.magenta }
                    hl.CmpItemKindClass = { fg = c.yellow }
                    hl.CmpItemKindInterface = { fg = c.yellow }
                    hl.CmpItemKindModule = { fg = c.cyan }
                    hl.CmpItemKindProperty = { fg = c.orange }
                    hl.CmpItemKindUnit = { fg = c.green }
                    hl.CmpItemKindValue = { fg = c.pink }
                    hl.CmpItemKindEnum = { fg = c.yellow }
                    hl.CmpItemKindKeyword = { fg = c.cyan }
                    hl.CmpItemKindSnippet = { fg = c.green }
                    hl.CmpItemKindColor = { fg = c.pink }
                    hl.CmpItemKindFile = { fg = c.blue }
                    hl.CmpItemKindReference = { fg = c.orange }
                    hl.CmpItemKindFolder = { fg = c.blue }
                    hl.CmpItemKindEnumMember = { fg = c.green }
                    hl.CmpItemKindConstant = { fg = c.orange }
                    hl.CmpItemKindStruct = { fg = c.yellow }
                    hl.CmpItemKindEvent = { fg = c.pink }
                    hl.CmpItemKindOperator = { fg = c.cyan }
                    hl.CmpItemKindTypeParameter = { fg = c.yellow }
                    hl.CmpItemMenu = { fg = c.cyan, italic = true }
                    
                    -- Which-key
                    hl.WhichKey = { fg = c.cyan, bold = true }
                    hl.WhichKeyGroup = { fg = c.magenta, bold = true }
                    hl.WhichKeyDesc = { fg = c.green }
                    hl.WhichKeySeparator = { fg = c.orange }
                    hl.WhichKeyFloat = { bg = "NONE" }
                    hl.WhichKeyBorder = { fg = c.magenta, bg = "NONE" }
                    
                    -- Notify
                    hl.NotifyERRORBorder = { fg = c.red, bg = "NONE" }
                    hl.NotifyWARNBorder = { fg = c.orange, bg = "NONE" }
                    hl.NotifyINFOBorder = { fg = c.cyan, bg = "NONE" }
                    hl.NotifyDEBUGBorder = { fg = c.fg_dark, bg = "NONE" }
                    hl.NotifyTRACEBorder = { fg = c.pink, bg = "NONE" }
                    hl.NotifyERRORIcon = { fg = c.red }
                    hl.NotifyWARNIcon = { fg = c.orange }
                    hl.NotifyINFOIcon = { fg = c.cyan }
                    hl.NotifyDEBUGIcon = { fg = c.fg_dark }
                    hl.NotifyTRACEIcon = { fg = c.pink }
                    hl.NotifyERRORTitle = { fg = c.red, bold = true }
                    hl.NotifyWARNTitle = { fg = c.orange, bold = true }
                    hl.NotifyINFOTitle = { fg = c.cyan, bold = true }
                    hl.NotifyDEBUGTitle = { fg = c.fg_dark, bold = true }
                    hl.NotifyTRACETitle = { fg = c.pink, bold = true }
                    
                    -- Terminal colors
                    vim.g.terminal_color_0 = "#1a1b26"
                    vim.g.terminal_color_1 = "#FF0040"
                    vim.g.terminal_color_2 = "#39FF14"
                    vim.g.terminal_color_3 = "#FFFF00"
                    vim.g.terminal_color_4 = "#00BFFF"
                    vim.g.terminal_color_5 = "#FF00FF"
                    vim.g.terminal_color_6 = "#00FFFF"
                    vim.g.terminal_color_7 = "#e6e6e6"
                    vim.g.terminal_color_8 = "#545c7e"
                    vim.g.terminal_color_9 = "#FF0040"
                    vim.g.terminal_color_10 = "#39FF14"
                    vim.g.terminal_color_11 = "#FFFF00"
                    vim.g.terminal_color_12 = "#00BFFF"
                    vim.g.terminal_color_13 = "#FF00FF"
                    vim.g.terminal_color_14 = "#00FFFF"
                    vim.g.terminal_color_15 = "#ffffff"
                end,
            })
            
            vim.cmd([[colorscheme tokyonight-night]])
            
            -- Additional transparency settings
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "*",
                callback = function()
                    -- Ensure transparency persists after colorscheme changes
                    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
                    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
                    vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
                    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE", ctermbg = "NONE" })
                    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE", ctermbg = "NONE" })
                    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE", ctermbg = "NONE" })
                    vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "NONE", ctermbg = "NONE" })
                end,
            })
        end,
    },
    
    -- Additional colorscheme options
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
        opts = {
            flavour = "mocha",
            transparent_background = true,
            custom_highlights = function(colors)
                return {
                    Comment = { fg = colors.flamingo, style = { "italic" } },
                    ["@constant.builtin"] = { fg = colors.peach, style = {} },
                    ["@comment"] = { fg = colors.flamingo, style = { "italic" } },
                }
            end
        },
    },
}