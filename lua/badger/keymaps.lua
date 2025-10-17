--Define la tecla lider como la barra espaciadora
vim.g.mapleader = ' '
local map = vim.keymap.set

--Moviendo el focus de ventana

map('n', '<leader>w', '<C-w>k', {desc = 'Moverse a la ventana de arriba'})
map('n', '<leader>d', '<C-w>l', {desc = 'Moverse a la ventana de la derecha'})
map('n', '<leader>s', '<C-w>j', {desc = 'Moverse a la ventana de abajo'})
map('n', '<leader>a', '<C-w>h', {desc = 'Moverse a la ventana de la izquierda'})


--Guardando la sesion con ctr + s
map({'n', 'i', 'v'}, '<C-s>', '<cmd>w<CR>', { noremap = true, silent = true, desc = 'Guardar archivo' })

--Abriendo terminal con ctr + /
-- Variable para guardar el numero del buffer de nuestra terminal
local terminal_buf = nil

-- Funcion para abrir/cerrar la terminal
-- Variable para guardar el numero del buffer de nuestra terminal
local terminal_buf = nil

-- Funcion para abrir/cerrar la terminal
local function ToggleTerminal()
  -- Usamos win_findbuf, que devuelve una lista de IDs de ventana.
  -- Si el buffer no es valido, devuelve una tabla vacia {}.
  local term_wins = {}
  if terminal_buf and vim.api.nvim_buf_is_valid(terminal_buf) then
    term_wins = vim.fn.win_findbuf(terminal_buf)
  end

  -- Si la lista NO esta vacia, significa que la ventana de la terminal esta abierta.
  if #term_wins > 0 then
    -- La cerramos usando el ID de ventana correcto (el primero de la lista).
    vim.api.nvim_win_close(term_wins[1], false)
  else
    -- Si la ventana no existe, la creamos de nuevo.
    vim.cmd('belowright 10split | terminal')
    terminal_buf = vim.api.nvim_get_current_buf() -- Guardamos el buffer de la nueva terminal.

    -- (Opcional pero recomendado) Mapeo para salir de la terminal con ESC.
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { buffer = terminal_buf, noremap = true })

    -- (Opcional pero recomendado) Limpiamos nuestra variable si el buffer de la terminal se cierra.
    -- Esto evita problemas si cierras la terminal con "exit" en lugar del atajo.
    vim.api.nvim_create_autocmd("BufWipeout", {
      buffer = terminal_buf,
      once = true,
      callback = function()
        terminal_buf = nil
      end,
    })
  end
end

-- El mapeo no cambia
map({'n', 'i'}, '<C-/>', ToggleTerminal, {
  noremap = true,
  silent = true,
  desc = 'Abrir/Cerrar terminal abajo',
})

--Quitar la sesion con " " q + q

map('n', '<leader>qq', '<cmd>q<CR>')

--Cerrar todas las sesiones
map('n', '<leader>qa', '<cmd>qa<CR>')

--Cerrar y guardar
map('n', '<leader>qw', '<cmd>wq<CR>')

--Manjeo de telescope
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

--Neo-tree para busqueda de archivos
map('n', '<leader>e', '<cmd>Neotree toggle<CR>', {desc = 'Abrir/Cerrar Explorador'})
