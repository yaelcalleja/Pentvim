--Config para el gestor de archivos que sale por la parte izquierda y permite visualizar los archivos

-- Configuración de Neo-tree
require('neo-tree').setup({
   window = {
    position = "left",
    width = 30
  },
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = true,
    }
  }
})


