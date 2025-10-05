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
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'

    -- Autocompletado
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    -- Corregido el error de tipeo en el nombre de usuario
    use 'L3MON4D3/LuaSnip'

    -- Linting y formateo
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'jayp0521/mason-null-ls.nvim'

    -- Resaltado de sintaxis avanzado
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

end)
