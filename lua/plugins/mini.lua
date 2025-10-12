return
    { 
        'nvim-mini/mini.nvim', 
        version = false,

        config = function()

            options = { permenant_delete = false }

            require('mini.notify').setup({
                lsp_progress = { enable = true },
            })
            vim.notify = require('mini.notify').make_notify()


            local starter = require('mini.starter')

            starter.setup({
                evaluate_single = false,
                  items = {
                    starter.sections.sessions(5, true),
                    starter.sections.builtin_actions(),
                    starter.sections.recent_files(5, true),
                },
            })

            require('mini.git').setup()
            require('mini.sessions').setup()

            require('mini.diff').setup()

            vim.keymap.set('n', '<F7>', '<cmd>lua MiniDiff.toggle_overlay()<CR>', 
            { desc = 'Toggle diff overlay' })
            vim.keymap.set('n', '<F6>', '<cmd>lua MiniDiff.goto_hunk("prev")<CR>', 
            { desc = 'next hunk' })
            vim.keymap.set('n', '<F8>', '<cmd>lua MiniDiff.goto_hunk("next")<CR>', 
            { desc = 'prev hunk' })

            vim.keymap.set('n', '<F2>', function()
                bufName = vim.api.nvim_buf_get_name(0)
                if bufName == "" then
                    require('mini.files').open(vim.loop.cwd())
                else
                    require('mini.files').open(bufName)
                end
            end, { desc = 'Open mini.files' })
        end


    }

