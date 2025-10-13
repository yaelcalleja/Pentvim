vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer se autogestiona
    use 'wbthomason/packer.nvim'

    -- Colorscheme: nightfox
    use {
        'EdenEast/nightfox.nvim',
        as = 'nightfox', -- Cambiado para mayor claridad
        config = function()
            -- El nombre correcto del tema es 'nordfox'
            vim.cmd('colorscheme nordfox')
        end
    }

    -- Iconos para la UI
    use 'nvim-tree/nvim-web-devicons'

    -- Barra de estado (Lualine)
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- CORRECTO: Cada plugin en su propia línea 'use'
    -- LSP (Language Server Protocol)
    use 'neovim/nvim-lspconfig' -- Base LSP configuration
    use 'williamboman/mason.nvim' -- Installs LSPs
    use {
    'williamboman/mason-lspconfig.nvim',
    -- Make sure it runs after mason
    requires = {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
         },
    }
      -- Autocompletado
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    -- Corregido el error de tipeo en el nombre de usuario
    use 'L3MON4D3/LuaSnip'

    -- Linting y formateo
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Resaltado de sintaxis avanzado
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    -- File exporer desde el lateral de la pantalla
    
    --Requerimientos de los pluggins para funcionar
    use 'nvim-lua/plenary.nvim'
    use 'MunifTanjim/nui.nvim'

    -- Telescope

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.x',
        requires = {{'nvim-lua/plenary.nvim'}},
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
    --Neo-Tree
    use {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        }
    }
end)
