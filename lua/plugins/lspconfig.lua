-- lua/plugins/lspconfig.lua
return {
  "neovim/nvim-lspconfig",
  config = function()

    local lspconfig = require("lspconfig")

    -- Example: Lua language server
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })
    end 
}
