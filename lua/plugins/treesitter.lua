return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',

    config = function()
        require('nvim-treesitter').setup {
            install_dir = vim.fn.stdpath('data') .. '/site',
            --require('nvim-treesitter').install { "lua", "python", "javascript", "c_sharp", "cpp" },
            ensure_installed = { "lua", "python", "javascript", "c_sharp", "cpp" },
            highlight = {
                enable = true,
            },
        }
  end,
}

