--Here are the settings for all the conf

--Give the number for the line of the code

vim.opt.nu = true
vim.opt.relativenumber = true

--Make the tab give 4 spaces when hit

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

--Idenado inteligente

vim.opt.smartindent = true

--No ajustar lineas

vim.opt.wrap = false

--Sepa la bola

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/.undodir"
vim.opt.undofile = true

--Habilitar los colores verdaderos

vim.opt.termguicolors = true

--No resaltar todas las coincidencias

vim.opt.hlsearch = false

--Resaltar las coincidencias mientras escribes

vim.opt.incsearch = true

--Mantener las lineas del contexto al hacer scroll

vim.opt.scrolloff = 8

--Siempre mostrar la columna de signos

vim.opt.signcolumn = "yes"
