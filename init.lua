--This load the conf of the nvim program

require('badger.packer')
require('badger.settings')
require('badger.keymaps')
require('badger.diagnostics')


--Load the conf for the plugins
require('plugins.lsp')
require('plugins.cmp')
--require('plugins.null-ls')
require('plugins.lualine')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.neo-tree')
require('plugins.autocmds')
