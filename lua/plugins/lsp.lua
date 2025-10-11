-- lua/plugins/lsp.lua
local lspconfig = require('lspconfig')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

-- Inicializa Mason (manejador de paquetes para LSPs, linters, etc.)
mason.setup()

-- --- Mapeos de teclado para LSP ---
-- Esta función se ejecutará una vez que un servidor LSP se adjunte a un buffer
local on_attach = function(client, bufnr)
  -- Helper para crear mapeos solo para este buffer
  local bufmap = function(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = bufnr })
  end

  -- Mapeos de teclado comunes para LSP
  bufmap('n', 'gD', vim.lsp.buf.declaration)      -- Ir a la declaración
  bufmap('n', 'gd', vim.lsp.buf.definition)      -- Ir a la definición
  bufmap('n', 'K', vim.lsp.buf.hover)            -- Mostrar documentación al pasar el cursor
  bufmap('n', 'gi', vim.lsp.buf.implementation)  -- Ir a la implementación
  bufmap('n', '<leader>rn', vim.lsp.buf.rename)      -- Renombrar símbolo
  bufmap('n', '<leader>ca', vim.lsp.buf.code_action) -- Acciones de código (ej. corregir error)
  bufmap('n', 'gr', vim.lsp.buf.references)      -- Mostrar referencias
  bufmap('n', '<leader>e', vim.diagnostic.open_float) -- Mostrar diagnósticos (errores/warnings)
end

-- Capacidades que le decimos al servidor LSP que nuestro cliente (Neovim) soporta
-- Aquí usamos las capacidades que provee nvim-cmp para la autocompletación
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- --- Configuración principal de Mason-LSPConfig ---
-- Esta es la parte central que conecta Mason con lspconfig
mason_lspconfig.setup({
  -- Lista de servidores que `mason-lspconfig` debe asegurarse de que estén instalados
  ensure_installed = { "pyright", "clangd" },

  -- Habilita la instalación automática de servidores si no se encuentran
  automatic_installation = true, -- CORREGIDO: El typo era "atutomatic_installation"

  -- Aquí definimos cómo se debe configurar cada servidor.
  -- Esta tabla de `handlers` reemplaza la llamada incorrecta a `setup_handlers`
  handlers = {
    -- Este es el manejador por defecto. Se usará para CUALQUIER servidor
    -- que no tenga una configuración específica más abajo (como clangd).
    function(server_name)
      lspconfig[server_name].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,

    -- Configuración específica para `pyright`
    ["pyright"] = function()
      lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              -- Puedes descomentar y ajustar esto si usas entornos virtuales
              -- venvPath = ".",
              -- venv = "mi-entorno-virtual"
            }
          }
        }
      })
    end,
    -- Ya no necesitamos un manejador específico para `clangd` porque
    -- la función por defecto de arriba ya hace exactamente lo que necesita.
  }
})
