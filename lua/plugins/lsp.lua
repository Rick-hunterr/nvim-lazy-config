-- ===================================================
-- LSP y autocompletado
-- ===================================================
return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = 'v3.x',
    dependencies = {
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'}
    },
    config = function()
      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
      end)

      require('mason').setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })

      require('mason-lspconfig').setup({
        ensure_installed = {'pyright', 'tsserver', 'lua_ls'},
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            require('lspconfig').lua_ls.setup({
              settings = {
                Lua = {diagnostics = {globals = {'vim'}}}
              }
            })
          end
        }
      })

      -- Configuración del autocompletado con iconos cyberpunk
      local cmp = require('cmp')
      local cmp_select = {behavior = cmp.SelectBehavior.Select}
      local kind_icons = {
        Text = "󰦨", Method = "󰆧", Function = "󰊕", Constructor = "",
        Field = "󰇽", Variable = "󰀫", Class = "󰠱", Interface = "",
        Module = "", Property = "󰜢", Unit = "󰑭", Value = "󰎠",
        Enum = "", Keyword = "󰌋", Snippet = "󰏗", Color = "󰏘",
        File = "󰈙", Reference = "󰈇", Folder = "󰉋", EnumMember = "",
        Constant = "󰏿", Struct = "", Event = "", Operator = "󰆕",
        TypeParameter = "󰅲"
      }

      cmp.setup({
        window = {
          completion = {border = "rounded", winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None"},
          documentation = {border = "rounded"}
        },
        formatting = {
          format = function(entry, vim_item)
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind] or '?', vim_item.kind)
            return vim_item
          end
        },
        sources = {{name = 'nvim_lsp'}, {name = 'luasnip'}, {name = 'buffer'}, {name = 'path'}},
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-y>'] = cmp.mapping.confirm({select = true}),
          ['<C-Space>'] = cmp.mapping.complete()
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        }
      })
    end
  }
}
