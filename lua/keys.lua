vim.api.nvim_create_user_command('W', function() end, {})

vim.keymap.set("n", "<S-y>", "y$")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set('n', '<C-Insert>', ':tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Delete>', ':tabclose<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-End>', ':tabn<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Home>', ':tabp<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<F5>', ':Term<CR>', {noremap = true, silent=true})
vim.keymap.set('n', '<F1>', '', {noremap = true, silent=true})

vim.keymap.set('v', '<Leader>y', '"*y');
vim.keymap.set('n', '<Leader>p', '"*p');

vim.api.nvim_create_user_command('Term', function(opts)
    vim.cmd("tabnew | lcd %:p:h | terminal")
    vim.cmd("startinsert")
end, { nargs = "*" })


vim.api.nvim_create_user_command('WriteSession', function(opts)
        local name = opts.args ~= '' and opts.args or require('mini.sessions').get_latest()

        if name == nil then
            name = vim.fn.input('Session name: ')
        end
        require('mini.sessions').write(name)
    end,
{ nargs = '?' }
)

vim.api.nvim_create_user_command('LoadSession', function(opts)
    local name = opts.args
    require('mini.sessions').read(name);
    print('Loaded session "' .. name .. '"')
end,
{nargs = 1}
)


---- Terminal mode mappings for easy window navigation
vim.api.nvim_set_keymap('t', '<C-w>', [[<C-\><C-n><C-w>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-n>', [[<C-\><C-n>]], { noremap = true, silent = true })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<Leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
