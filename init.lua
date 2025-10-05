--This load the conf of the nvim program

require('badger.settings')
require('badger.keymaps')
require('badger.packer')

--Load the conf for the plugins
require('plugins.lsp')
require('plugins.cmp')
require('plugins.null-ls')
require('plugins.lualine')
require('plugins.treesitter')
