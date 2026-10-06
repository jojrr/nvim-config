return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()
  ensure_installed = { "omnisharp", "lua_ls", "clangd" }

  local on_attach = function(client, bufnr)
      local opts = { noremap=true, silent=true, buffer=bufnr } 
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) 
      vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, opts) 
      vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    end

    vim.lsp.config("lua_ls", {
      on_attach = on_attach,
      settings = {
        Lua = { diagnostics = { globals = { "vim" } } },
      },
    })

    vim.lsp.enable("lua_ls")
    vim.lsp.enable("omnisharp")

  end
}

