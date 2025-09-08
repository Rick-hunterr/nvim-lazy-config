-- ===================================================
-- Core Configuration Loader
-- ===================================================

local M = {}

function M.setup()
    -- Load core modules in order
    require("config.options")
    require("config.keymaps")
    require("config.autocmds")
    
    -- Print success message
    vim.defer_fn(function()
        vim.notify("Neovim, HOLA PABLO!", vim.log.levels.INFO, {
            title = "Neovim",
            timeout = 2000,
        })
    end, 100)
end

-- NO auto-setup - solo retornar el módulo
return M