-- lua/plugins/lsp.lua
local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- LSPs que quieres instalar
local servers = { "pyright", "clangd" }

-- Configura mason para que se encargue de la instalación de LSPs, linters, etc.
mason.setup()

-- Configura mason-lspconfig para conectar mason con nvim-lsp
mason_lspconfig.setup({
	-- Asegúrate de que los servidores en la lista 'servers' estén instalados
	ensure_installed = servers,
	-- Instala automáticamente los servidores si no se encuentran
	automatic_installation = true,
})

-- Mapeos de teclado para LSP. Se activarán cuando un LSP se conecte a un buffer.
-- Tu función on_attach está perfecta, no necesita cambios.
local on_attach = function(client, bufnr)
	local bufmap = function(mode, lhs, rhs)
		vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = bufnr, desc = desc })
	end
	bufmap("n", "gD", vim.lsp.buf.declaration)
	bufmap("n", "gd", vim.lsp.buf.definition)
	bufmap("n", "K", vim.lsp.buf.hover)
	bufmap("n", "gi", vim.lsp.buf.implementation)
	bufmap("n", "<leader>rn", vim.lsp.buf.rename)
	bufmap("n", "<leader>ca", vim.lsp.buf.code_action)
	bufmap("n", "gr", vim.lsp.buf.references)
	bufmap("n", "<leader>e", vim.diagnostic.open_float)
end
-- Capacidades para que nvim-cmp funcione con el LSP
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Bucle para configurar cada servidor de la lista 'servers'
-- Esto evita tener que escribir una configuración para cada uno por separado
for _, server_name in ipairs(servers) do
	lspconfig[server_name].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		-- NOTA: Se eliminó la configuración específica de pyright.
		-- Pyright es excelente detectando entornos virtuales (como .venv, venv)
		-- por sí solo. Es mejor no forzarlo a uno específico.
	})
end
