vim.g.mapleader = ','
vim.g.localmapleader = '¬'
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
require("plugins.treesitter");
require("plugins.mini");
require("plugins.todo");
require("plugins.telescope");
require("plugins.vimTex");

require("plugins.tabby");
vim.o.showtabline = 2;
vim.o.guicursor = "v:blinkon10-blinkoff100"
