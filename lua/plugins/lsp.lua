-- lua/plugins/lsp.lua
local lspconfig = require('lspconfig')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup()

mason_lspconfig.setup({
  atutomatic_installation = true,
  ensure_installed = { "pyright", "clangd" } -- LSPs para Python y C+
})

-- Mapeos de teclado para LSP
local on_attach = function(client, bufnr)
  local bufmap = function(mode, lhs, rhs) 
    vim.keymap.set(mode, lhs, rhs, 
    { silent = true, buffer = bufnr })
end,
  
  bufmap('n', 'gD', vim.lsp.buf.declaration)
  bufmap('n', 'gd', vim.lsp.buf.definition)
  bufmap('n', 'K', vim.lsp.buf.hover)
  bufmap('n', 'gi', vim.lsp.buf.implementation)
  bufmap('n', '<leader>rn', vim.lsp.buf.rename)
  bufmap('n', '<leader>ca', vim.lsp.buf.code_action)
  bufmap('n', 'gr', vim.lsp.buf.references)
  bufmap('n', '<leader>e', vim.diagnostic.open_float)
end

-- Configuración de los servidores
local capabilities = require('cmp_nvim_lsp').default_capabilities()

mason_lspconfig.setup_handlers {
  function (server_name)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
  
  ["pyright"] = function()
    lspconfig.pyright.setup{
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            -- Opciones específicas si usas entornos virtuales
            -- venvPath = ".",
            -- venv = "mi-entorno-virtual"
          }
        }
      }
    }
  end,
  
  ["clangd"] = function()
    lspconfig.clangd.setup{
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
}

