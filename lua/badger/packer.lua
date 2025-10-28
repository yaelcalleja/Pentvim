vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer se autogestiona
    use 'wbthomason/packer.nvim'

    -- Colorscheme: kanagawa
    use {
        'Rebelot/kanagawa.nvim',
        as = 'kanagawa', -- Cambiado para mayor claridad
        config = function()
            -- El nombre del tema es kanagawa y dragon es el colorscheme
            vim.cmd('colorscheme kanagawa-dragon')
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
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp', -- Source for LSP completions
            'hrsh7th/cmp-buffer',   -- Source for buffer completions
            'hrsh7th/cmp-path',     -- Source for path completions
            'L3MON4D3/LuaSnip',     -- Snippet engine
            'saadparwaiz1/cmp_luasnip', -- Source for snippet completions
        },
    }

    --Autocompletado de pares

    use 'windwp/nvim-autopairs'

    -- Linting y formateo
    use 'nvimtools/none-ls.nvim'
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

        -- Titulo del nvim
        dashboard.section.header.val = {
           '  ▄███████▄    ▄████████ ███▄▄▄▄        ███     ▄█    █▄   ▄█      ▄▄▄▄███▄▄▄▄    ',
             '  ███    ███   ███    ███ ███▀▀▀██▄   ▀█████████▄ ███    ███ ███   ▄██▀▀▀███▀▀▀██▄ ',
             '  ███    ███   ███    █▀  ███   ███     ▀███▀▀██ ███    ███ ███▌ ███    ███   ███ ',
            '  ███    ███  ▄███▄▄▄     ███   ███       ███   ▀ ███    ███ ███▌ ███    ███   ███ ',
            '▀█████████▀  ▀▀███▀▀▀     ███   ███       ███     ███    ███ ███▌ ███    ███   ███ ',
             '  ███          ███    █▄  ███   ███       ███     ███    ███ ███  ███    ███   ███ ',
            '  ███          ███    ███ ███   ███       ███     ███    ███ ███  ███    ███   ███ ',
            ' ▄████▀         ██████████  ▀█   █▀       ▄████▀     ▀██████▀  █▀     ▀█    ███   █▀  ',
            '                                                                          By Badger.',
        }
        dashboard.section.header.opts.hl = 'String'

        -- Botones
        dashboard.section.buttons.val = {
            dashboard.button("n", " Nuevo archivo", ":enew<CR>"),
            dashboard.button("s", "  Buscar un archivo", ":Telescope find_files<CR>"),
            dashboard.button("S", "󰄴  Sincronizar plug-ins", ":PackerSync<CR>"),
            dashboard.button("m", "  Mason para lenguajes de programacion", ":Mason<CR>"),
            dashboard.button("g", "󰊢  Ver cambios de Git", ":Telescope git_status<CR>"),
            dashboard.button("c", "⚙️   Editar configuración", ":e $MYVIMRC<CR>"),
            dashboard.button("t", "   Buscar texto en proyecto", ":Telescope live_grep<CR>"),
            dashboard.button("Space + e", "󰥩 File explorer"),
            dashboard.button("q", "󰈆  Salir", ":qa<CR>"),
        }
        dashboard.section.buttons.opts.hl = 'Function'

        -- Pie de página
        dashboard.section.footer.val = {
            '🕉️ Sabiduría: Visión correcta, pensamiento correcto.',
            'Conducta ética: Habla correcta, acción correcta, sustento correcto.',
            'Disciplina mental: Esfuerzo correcto, atención correcta, concentración correcta. 🕉️'
        }
        dashboard.section.footer.opts.hl = 'Comment'

        -- Layout
        dashboard.layout = {
            {type = "header",  val = dashboard.section.header.val,  opts = dashboard.section.header.opts},
            {type = "padding", val = 5},
            {type = "buttons", val = dashboard.section.buttons.val, opts = dashboard.section.buttons.opts},
            {
                type = "padding",
                val = function(_, remaining)
                    return remaining
                end,
            },
            {type = "footer",  val = dashboard.section.footer.val,  opts = dashboard.section.footer.opts},
        }
        
        alpha.setup(dashboard.opts)
    end
}
end)
