vim.g.mapleader = ','
vim.g.localmapleader = '\\'
require("config.lazy")
require("set")
require("keys")

require("plugins.surround")
require("plugins.mason")
vim.lsp.config('lua_ls', {})
vim.lsp.enable('lua_ls')

require("plugins.undotree")
require("plugins.cmp");
require("plugins.oil");
require("plugins.mini");
require("plugins.todo");
require("plugins.telescope");

require("plugins.tabby");
vim.o.showtabline = 2;

vim.o.shell = 'powershell.exe'

-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if client and client.server_capabilities.colorProvider then
--       vim.lsp.document_color.enable(true, args.buf)
--     end
--   end,
-- })


