return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "omnisharp", "lua_ls", "pyright", "clangd" },
      automatic_installation = true,
    })

    local lspconfig = require("lspconfig")

    local omnisharp_bin = "C:/Users/bluei/AppData/Local/nvim-data/mason/packages/omnisharp/OmniSharp.exe"

    local on_attach = function(client, bufnr)
      local opts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    end

    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = { diagnostics = { globals = { "vim" } } },
      },
    })

    lspconfig.pyright.setup({ on_attach = on_attach })

    lspconfig.omnisharp.setup({
      cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(vim.loop.getpid()) },
      cmd_env = {
        DOTNET_CLI_UI_LANGUAGE = "en",
        DOTNET_SYSTEM_GLOBALIZATION_INVARIANT = "1",
        LANG = "en_US.UTF-8",
        LC_ALL = "en_US.UTF-8"
      },
      on_attach = on_attach,
    })
  end,
}

