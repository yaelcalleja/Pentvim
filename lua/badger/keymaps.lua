--Define la tecla lider como la barra espaciadora
vim.g.mapleader = ' '
local map = vim.keymap.set

--Moviendo el focus de ventana

map('n', '<leader>w', '<C-w>k', {desc = 'Moverse a la ventana de arriba'})
map('n', '<leader>d', '<C-w>l', {desc = 'Moverse a la ventana de la derecha'})
map('n', '<leader>s', '<C-w>j', {desc = 'Moverse a la ventana de abajo'})
map('n', '<leader>a', '<C-W>a', {desc = 'Moverse a la ventana de la izquierda'})


