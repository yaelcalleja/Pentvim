-- lua/core/autocmds.lua

local augroup = vim.api.nvim_create_augroup('FileTypeKeymaps', { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- Atajos para C++
autocmd('FileType', {
  group = augroup,
  pattern = 'cpp',
  callback = function()
    -- :w guarda el archivo antes de ejecutar
    -- 'read -p' mantiene la terminal abierta hasta que presiones Enter
    vim.keymap.set('n', '<leader>r', ':w | belowright 12split | terminal g++ % -o %< && ./%< && echo "" && read -p "Presiona Enter para cerrar..." && exit<CR>',
      { buffer = true, noremap = true, silent = true, desc = "Compilar y ejecutar C++" })
  end,
})

-- Atajos para Python
autocmd('FileType', {
  group = augroup,
  pattern = 'python',
  callback = function()
    vim.keymap.set('n', '<leader>r', ':w | belowright 12split | terminal python3 %<CR>',
      { buffer = true, noremap = true, silent = true, desc = "Ejecutar Python" })
  end,
})
