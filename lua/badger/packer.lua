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
    --Alpha-nvim para la pantalla de inicio
    use {
    'goolord/alpha-nvim',
    config = function ()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')

        -- Titulo del nvim (¡Esto ya estaba perfecto!)
        dashboard.section.header.val = {
            '  ▄███████▄    ▄████████ ███▄▄▄▄         ███     ▄█    █▄   ▄█     ▄▄▄▄███▄▄▄▄    ',
            '  ███    ███   ███    ███ ███▀▀▀██▄  ▀█████████▄ ███    ███ ███   ▄██▀▀▀███▀▀▀██▄ ',
            '  ███    ███   ███    █▀  ███   ███     ▀███▀▀██ ███    ███ ███▌ ███    ███   ███ ',
            '  ███    ███  ▄███▄▄▄     ███   ███      ███   ▀ ███    ███ ███▌ ███    ███   ███ ',
            '▀█████████▀  ▀▀███▀▀▀     ███   ███      ███     ███    ███ ███▌ ███    ███   ███ ',
            '  ███          ███    █▄  ███   ███      ███     ███    ███ ███  ███    ███   ███ ',
            '  ███          ███    ███ ███   ███      ███     ███    ███ ███  ███    ███   ███ ',
            ' ▄████▀         ██████████  ▀█   █▀     ▄████▀     ▀██████▀  █▀    ▀█    ███   █▀  ',
        }
        dashboard.section.header.opts.hl = 'String'

        -- Botones que usaremos en la pantalla de inicio
        dashboard.section.buttons.val = {
            dashboard.button("n", " Nuevo archivo", ":enew<CR>"),
            dashboard.button("s", "  Buscar un archivo", ":Telescope find_files<CR>"),
            dashboard.button("c", "󰄴  Sincronizar plug-ins", ":PackerSync<CR>"),
            dashboard.button("m", "  Mason para lenguajes de programacion", ":Mason<CR>"),
            dashboard.button("q", "󰈆  Salir", ":qa<CR>"),
        }
        dashboard.section.buttons.opts.hl = 'Function'

        -- PIE DE PÁGINA

        dashboard.section.footer.val = {
            '🕉️ Sabiduría: Visión correcta, pensamiento correcto.',
            'Conducta ética: Habla correcta, acción correcta, sustento correcto.',
            'Disciplina mental: Esfuerzo correcto, atención correcta, concentración correcta. 🕉️'
        }
        dashboard.section.footer.opts.hl = 'Comment'

        --Layout
        dashboard.layout = {
                {type = "header", val = dashboard.section.header.val, opts = dashboard.section.header.opts},
                {type = "padding", val = 2},
                {type = "buttons", val = dashboard.section.buttons.val, opts = dashboard.section.buttons.opts},
                {type = "padding", val = 5},
                {type = "footer", val = dashboard.section.footer.val, opts = dashboard.section.footer.opts},
            }
        alpha.setup(dashboard.opts)
    end
}
end)
