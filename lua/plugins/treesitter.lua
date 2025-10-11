require('nvim-treesitter.configs').setup {
  -- Una lista de parsers a instalar.
  
  ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp", "python", "rust", "go", "bash", "json" },

  -- Instalar parsers de forma síncrona (bloquea Neovim hasta que se instale)
  sync_install = false,

  -- Instalar parsers automáticamente para los lenguajes que abras.
  
  auto_install = true,

  -- Configuración del módulo de resaltado de sintaxis (highlighting).
  highlight = {
    -- Activa el resaltado de sintaxis basado en Treesitter.
    enable = true,

--Para archivos muy grandes, desactivar el resaltado para evitar lentitud.
    disable = { "c", "rust" },
    --Desactivar para archivos de más de 500 KB o 2000 líneas
    disable = function(lang, buf)
    local max_filesize = 500 * 1024 
    local n_lines = vim.api.nvim_buf_line_count(buf)
    return vim.fn.getfsize(vim.api.nvim_buf_get_name(buf)) > max_filesize or n_lines > 2000
    end,

    -- Desactivar el resaltado de sintaxis por expresiones regulares de Vim.
    -- Se recomienda para que Treesitter tenga control total.
    additional_vim_regex_highlighting = false,
  },

  -- Activar el módulo de indentación basado en Treesitter.
  -- Proporciona una indentación más precisa según la estructura del código.
  indent = {
    enable = true,
  },
}
