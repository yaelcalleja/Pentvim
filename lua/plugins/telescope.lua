--Configurando telescope
require('telescope').setup({
    defaults = {
    }
})

--Cargando la extension fzf
pcall(require('telescope').load_extension, 'fzf')
