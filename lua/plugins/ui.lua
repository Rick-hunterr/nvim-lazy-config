-- ===================================================
-- UI Plugins Configuration
-- Enhanced Cyberpunk Theme for Neovim
-- ===================================================

return {
  -- Lualine (Status line)
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local custom_theme = {
        normal = {
          a = { bg = "#FF00FF", fg = "#000000", gui = "bold" },
          b = { bg = "#1a1b26", fg = "#00FFFF" },
          c = { bg = "NONE", fg = "#39FF14" },
        },
        insert = {
          a = { bg = "#00FFFF", fg = "#000000", gui = "bold" },
          b = { bg = "#1a1b26", fg = "#FF00FF" },
          c = { bg = "NONE", fg = "#39FF14" },
        },
        visual = {
          a = { bg = "#39FF14", fg = "#000000", gui = "bold" },
          b = { bg = "#1a1b26", fg = "#00FFFF" },
          c = { bg = "NONE", fg = "#FF00FF" },
        },
        command = {
          a = { bg = "#FFA500", fg = "#000000", gui = "bold" },
          b = { bg = "#1a1b26", fg = "#00FFFF" },
          c = { bg = "NONE", fg = "#39FF14" },
        },
      }

      require("lualine").setup({
        options = {
          theme = custom_theme,
          section_separators = { left = "", right = "" },
          component_separators = { left = "│", right = "│" },
          globalstatus = true,
          disabled_filetypes = { statusline = { "alpha" } },
        },
        sections = {
          lualine_a = { { "mode", fmt = function(str) return "▊ " .. str .. " ▊" end } },
          lualine_b = { 
            "branch", 
            { "diff", symbols = { added = " ", modified = " ", removed = " " } } 
          },
          lualine_c = { 
            "filename", 
            { 
              "diagnostics", 
              sources = { "nvim_diagnostic" }, 
              symbols = { error = " ", warn = " ", info = " ", hint = " " } 
            } 
          },
          lualine_x = {
            function()
              local msg = "No LSP"
              local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
              local clients = vim.lsp.get_active_clients()
              if next(clients) == nil then
                return msg
              end
              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return " " .. client.name
                end
              end
              return msg
            end,
            "encoding",
            "filetype",
          },
          lualine_y = { "progress" },
          lualine_z = { { "location", fmt = function(str) return "▊ " .. str .. " ▊" end } },
        },
      })
    end,
  },

  -- Nvim-tree (File Explorer)

-- File Explorer
{
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      -- Deshabilita el explorador de archivos predeterminado
      disable_netrw = true,
      -- Vuelve al buffer sin nombre cuando cierras nvim-tree
      hijack_netrw = true,
      -- Configuración de la vista del árbol
      view = {
        width = 30,
        -- Muestra los diagnósticos de LSP
        side = "left",
      },
      -- Comportamiento al abrir archivos
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      -- Habilita el seguimiento del archivo actual
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      -- Muestra el estado de Git
      git = {
        enable = true,
      },
      -- Muestra los diagnósticos de LSP
      diagnostics = {
        enable = true,
        show_on_dirs = true,
      },
      -- Cierra el explorador si es la última ventana
      renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
          show = {
            git = true,
            diagnostics = true,
          },
        },
      },
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
    })
    
    -- Mapeo de teclas para nvim-tree
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
  end,
},

  -- Alpha Dashboard (Enhanced with Project Preview)
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { 
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope.nvim",
      "ahmedkhalf/project.nvim"
    },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      local icons = require("nvim-web-devicons")

      -- Cyberpunk ASCII Header
      dashboard.section.header.val = {
        "                                                  .--.",
        "██████╗   █████╗ ██████╗ ██╗      ██████╗        |o_o |",
        "██╔══██╗ ██╔══██╗██╔══██║██║     ██╔═══██╗       |:_/ |",
        "██████╔╝ ███████║██████║ ██║     ██║   ██║      //   \\ \\",
        "██╔═══╝  ██╔══██║██╔══██╗██║     ██║   ██║     (|     | )",
        "██║      ██║  ██║██████╔╝███████╗╚██████╔╝    /'\\_   _/`\\",
        "╚═╝      ╚═╝  ╚═╝╚═════╝ ╚══════╝ ╚═════╝     \\___)=(___/",
        "                                                           ",
        "         ╔═══════════════════════════════════════╗        ",
        "         ║  B I T S  H U N T E R   N E O V I M   ║        ",
        "         ╚═══════════════════════════════════════╝        "
      }

      -- Get recent projects with file preview
      local function get_recent_projects()
        local project_nvim = require("project_nvim")
        local history = require("project_nvim.utils.history")
        local recent_projects = history.get_recent_projects()
        
        local projects_display = {}
        local max_projects = 6
        
        for i = 1, math.min(#recent_projects, max_projects) do
          local project_path = recent_projects[i]
          local project_name = vim.fn.fnamemodify(project_path, ":t")
          
          -- Get files in project
          local files_cmd = string.format(
            "find '%s' -type f -not -path '*/.*' -not -path '*/node_modules/*' | head -5",
            project_path
          )
          local files_output = vim.fn.system(files_cmd)
          local files = vim.split(files_output, "\n", { trimempty = true })
          
          -- Create project section
          local project_section = {
            string.format("   %s %s", "", project_name),
            string.format("   %s %s", "", vim.fn.pathshorten(project_path, 3)),
          }
          
          -- Add files with icons
          for j, file in ipairs(files) do
            if j <= 3 then -- Show max 3 files
              local file_name = vim.fn.fnamemodify(file, ":t")
              local file_ext = vim.fn.fnamemodify(file, ":e")
              local file_icon = icons.get_icon(file_name, file_ext, { default = true })
              local relative_path = string.gsub(file, vim.pesc(project_path .. "/"), "")
              
              table.insert(project_section, string.format("     %s %s", 
                file_icon or "", 
                vim.fn.pathshorten(relative_path, 2)
              ))
            end
          end
          
          if #files > 3 then
            table.insert(project_section, "     ⋮ " .. (#files - 3) .. " more files...")
          end
          
          table.insert(project_section, "")
          table.insert(projects_display, table.concat(project_section, "\n"))
        end
        
        return projects_display
      end

      -- Enhanced menu buttons
dashboard.section.buttons.val = {
  dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
  dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
  dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
  dashboard.button("g", "󰈕  Find text", ":Telescope live_grep<CR>"),
  dashboard.button("p", "  Projects", ":Telescope file_browser<CR>"),
  --dashboard.button("s", "󰆊  Sessions", ":SearchSession<CR>"),
  dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
  dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
  dashboard.button("m", "󰙅  Mason", ":Mason<CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

      -- Custom footer with system info
      local function footer()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        local version = vim.version()
        local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
        
        return {
          "",
          "┌" .. string.rep("─", 70) .. "┐",
          string.format("│  Loaded %d plugins in %.2fms%s│", 
            stats.count, ms, string.rep(" ", 70 - 25 - string.len(tostring(stats.count)) - string.len(tostring(ms)))),
          string.format("│  Neovim %d.%d.%d%s│", 
            version.major, version.minor, version.patch, string.rep(" ", 70 - 15 - string.len(tostring(version.major)) - string.len(tostring(version.minor)) - string.len(tostring(version.patch)))),
          string.format("│%s%s│", datetime, string.rep(" ", 70 - string.len(datetime) - 1)),
          "└" .. string.rep("─", 70) .. "┘",
          "",
          "    ⚡ Hack the Planet ⚡    Neural Interface Ready    ",
        }
      end

      -- Project preview section
      local function create_projects_section()
        local projects = get_recent_projects()
        if #projects == 0 then
          return {
            type = "text",
            val = {
              "",
              "   No recent projects found",
              "   Use :Telescope projects to browse",
              "",
            },
            opts = {
              position = "center",
              hl = "AlphaProjectsEmpty",
            },
          }
        end

        return {
          type = "group",
          val = {
            {
              type = "text",
              val = "   Recent Projects",
              opts = {
                position = "center",
                hl = "AlphaProjectsHeader",
              },
            },
            {
              type = "text", 
              val = "   ━━━━━━━━━━━━━━",
              opts = {
                position = "center",
                hl = "AlphaProjectsDivider",
              },
            },
            {
              type = "text",
              val = projects,
              opts = {
                position = "center",
                hl = "AlphaProjects",
              },
            },
          },
        }
      end

      -- Set highlights
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"

      -- Custom layout with projects
      dashboard.config.layout = {
        { type = "padding", val = 2 },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 1 },
        create_projects_section(),
        { type = "padding", val = 1 },
        {
          type = "text",
          val = footer(),
          opts = {
            position = "center",
            hl = "AlphaFooter",
          },
        },
      }

      alpha.setup(dashboard.config)

      -- Cyberpunk color scheme
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          vim.api.nvim_set_hl(0, "AlphaHeader", { 
            fg = "#FF00FF", 
            bold = true,
            italic = false 
          })
          vim.api.nvim_set_hl(0, "AlphaButtons", { 
            fg = "#00FFFF", 
            bold = true 
          })
          vim.api.nvim_set_hl(0, "AlphaFooter", { 
            fg = "#39FF14", 
            italic = true 
          })
          vim.api.nvim_set_hl(0, "AlphaProjectsHeader", { 
            fg = "#FFA500", 
            bold = true 
          })
          vim.api.nvim_set_hl(0, "AlphaProjectsDivider", { 
            fg = "#FF00FF" 
          })
          vim.api.nvim_set_hl(0, "AlphaProjects", { 
            fg = "#C0C0C0" 
          })
          vim.api.nvim_set_hl(0, "AlphaProjectsEmpty", { 
            fg = "#808080", 
            italic = true 
          })
        end,
      })

      -- Auto-refresh projects on focus
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*",
        callback = function()
          if vim.bo.filetype == "alpha" then
            vim.cmd("AlphaRedraw")
          end
        end,
      })
    end,
  },
  
  

  -- Bufferline (Enhanced Tab Bar)
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          themable = true,
          numbers = "none",
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          left_mouse_command = "buffer %d",
          middle_mouse_command = nil,
          indicator = {
            icon = "▎",
            style = "icon",
          },
          buffer_close_icon = "",
          modified_icon = "●",
          close_icon = "",
          left_trunc_marker = "",
          right_trunc_marker = "",
          max_name_length = 18,
          max_prefix_length = 15,
          tab_size = 18,
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = false,
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              text_align = "center",
              separator = true,
            },
          },
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          persist_buffer_sort = true,
          separator_style = "thin",
          enforce_regular_tabs = false,
          always_show_bufferline = true,
        },
        highlights = {
          fill = {
            bg = "NONE",
          },
          background = {
            fg = "#657b83",
            bg = "NONE",
          },
          buffer_selected = {
            fg = "#FF00FF",
            bold = true,
            italic = false,
          },
          buffer_visible = {
            fg = "#00FFFF",
            bg = "NONE",
          },
          close_button = {
            fg = "#657b83",
            bg = "NONE",
          },
          close_button_visible = {
            fg = "#00FFFF",
            bg = "NONE",
          },
          close_button_selected = {
            fg = "#FF00FF",
          },
          indicator_selected = {
            fg = "#FF00FF",
          },
          modified = {
            fg = "#FFA500",
            bg = "NONE",
          },
          modified_selected = {
            fg = "#39FF14",
          },
          separator = {
            fg = "#1a1b26",
            bg = "NONE",
          },
          tab_separator = {
            fg = "#1a1b26",
            bg = "NONE",
          },
        },
      })
    end,
  },

  -- Indent Guides (Clean, No Animation)
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("ibl").setup({
        indent = {
          char = "▏",
        },
        scope = {
          enabled = true,
          show_start = false,
          show_end = false,
          injected_languages = false,
          highlight = { "Function", "Label" },
        },
        exclude = {
          filetypes = {
            "help",
            "alpha",
            "dashboard",
            "neo-tree",
            "Trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
          },
        },
      })
    end,
  },

  -- Better UI Components
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = {
        enabled = true,
        default_prompt = "Input:",
        prompt_align = "left",
        insert_only = true,
        start_in_insert = true,
        border = "rounded",
        relative = "cursor",
        prefer_width = 40,
        width = nil,
        max_width = { 140, 0.9 },
        min_width = { 20, 0.2 },
        win_options = {
          winblend = 10,
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
      },
      select = {
        enabled = true,
        backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
        telescope = nil,
        builtin = {
          border = "rounded",
          relative = "editor",
          win_options = {
            winblend = 10,
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
        },
      },
    },
  },

  -- Enhanced Notifications
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      local notify = require("notify")
      notify.setup({
        background_colour = "#000000",
        fps = 60,
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "✎",
          WARN = "",
        },
        level = 2,
        minimum_width = 50,
        render = "compact",
        stages = "fade",
        timeout = 3000,
        top_down = false,
      })
      vim.notify = notify
    end,
  },

  -- Which-key (Keybinding Helper)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")
      wk.setup({
        plugins = {
          marks = true,
          registers = true,
          spelling = {
            enabled = true,
            suggestions = 20,
          },
          presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = true,
            nav = true,
            z = true,
            g = true,
          },
        },
        icons = {
          breadcrumb = "»",
          separator = "➜",
          group = "+",
        },
        popup_mappings = {
          scroll_down = "<c-d>",
          scroll_up = "<c-u>",
        },
        window = {
          border = "double",
          position = "bottom",
          margin = { 1, 0, 1, 0 },
          padding = { 1, 2, 1, 2 },
          winblend = 10,
        },
        layout = {
          height = { min = 4, max = 25 },
          width = { min = 20, max = 50 },
          spacing = 3,
          align = "center",
        },
      })

      -- Key mappings configuration
      wk.register({
        ["<leader>"] = {
          b = { name = "Buffer" },
          c = { name = "Code" },
          f = { name = "Find" },
          g = { name = "Git" },
          l = { name = "LSP" },
          s = { name = "Split" },
          t = { name = "Terminal" },
          u = { name = "UI" },
          w = "Save",
          q = "Quit",
          x = "Save & Quit",
        },
      })
    end,
  },
  

-- Auto Session Plugin
{
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      auto_session_use_git_branch = false,
      auto_session_enable_last_session = false,
      auto_restore_enabled = false,
      auto_save_enabled = true,
      session_lens = {
        buftypes_to_ignore = {},
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
    })
    
    -- Keymaps para manejo de sesiones
    vim.keymap.set("n", "<leader>ss", require("auto-session.session-lens").search_session, {
      noremap = true,
      desc = "Search sessions",
    })
    vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", {
      noremap = true, 
      desc = "Restore session",
    })
    vim.keymap.set("n", "<leader>sd", "<cmd>SessionDelete<CR>", {
      noremap = true,
      desc = "Delete session", 
    })
  end,
},

  -- Smooth Scrolling
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("neoscroll").setup({
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
        easing_function = "quadratic",
        pre_hook = nil,
        post_hook = nil,
        performance_mode = false,
      })
    end,
  },
}
