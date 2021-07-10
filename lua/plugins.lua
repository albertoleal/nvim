require('packer-init')

return require('packer').startup {
    function(use)
        -- Packer can manage itself as an optional plugin
        use 'wbthomason/packer.nvim'

        use 'nvim-lua/plenary.nvim'

        use 'rafamadriz/neon'
        use 'RRethy/nvim-base16'

        use "kyazdani42/nvim-web-devicons"
        use {
            'hoob3rt/lualine.nvim',
            config = function() require('plugins.lualine') end,
        }

        use 'famiu/nvim-reload'

        use 'nvim-lua/popup.nvim'

        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                {"nvim-lua/popup.nvim"},
                {"nvim-lua/plenary.nvim"},
                {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
            },
            config = function() require('plugins.telescope') end,
        }

        use {
            'junegunn/fzf.vim',
            require = {'junegunn/fzf', run = vim.fn['fzf#install'] },
            setup = function() vim.g.fzf_command_prefix = 'FZF' end,
            config = function() require('plugins.fzf') end,
        }

        use 'neovim/nvim-lspconfig'
        use 'kabouzeid/nvim-lspinstall'

        use {
            "hrsh7th/nvim-compe",
            config = function() require('plugins.compe') end,
        }

        use {
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function() require('plugins.trouble') end,
        }

        use 'folke/lsp-colors.nvim'

        use {
            'glepnir/lspsaga.nvim',
            config = function() require('plugins.lspsaga') end,
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            requires = {
                "nvim-treesitter/playground",
                "nvim-treesitter/nvim-treesitter-textobjects",
            },
            config = function() require('plugins.treesitter') end,
        }

        use {
            'onsails/lspkind-nvim',
            config = function() require('lspkind').init{} end,
        }

        use {
            "folke/which-key.nvim",
            config = function() require("which-key").setup{} end
        }

        use {
            'jghauser/mkdir.nvim',
            config = function() require('mkdir') end,
        }

        use {
            'lewis6991/gitsigns.nvim',
            requires = {
                'nvim-lua/plenary.nvim'
            },
            config = function() require('plugins.gitsigns') end,
        }

        use 'ray-x/go.nvim'

        use {
            'glepnir/dashboard-nvim',
            config = function() require('plugins.dashboard') end,
        }

        use 'famiu/bufdelete.nvim'

        use {
            'hrsh7th/vim-vsnip',
            requires = {
                'hrsh7th/vim-vsnip-integ',
                'rafamadriz/friendly-snippets',
            },
        }

        use {
            'lukas-reineke/indent-blankline.nvim',
            config = function()
                      vim.g.indent_blankline_char = "▏"

                      vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard", "nofile"}
                      vim.g.indent_blankline_buftype_exclude = {"terminal"}

                      vim.g.indent_blankline_show_trailing_blankline_indent = false
                      vim.g.indent_blankline_show_first_indent_level = false
            end,
        }
        use 'b3nj5m1n/kommentary'

        use {
            "blackCauldron7/surround.nvim",
            config = function() require('surround').setup {mappings_style = 'surround'} end,
        }

        use 'kevinhwang91/nvim-bqf'

        -- file explorer
        use {
            'tamago324/lir.nvim',
            config = function() require('plugins.lir') end,
        }

        -- generic (non lua) plugins
        use 'bronson/vim-trailing-whitespace'
        use 'mg979/vim-visual-multi'
        use 'tpope/vim-endwise'
        use 'rstacruz/vim-closer'
        use 'machakann/vim-swap'
        use 'AndrewRadev/splitjoin.vim'
        use 'tpope/vim-repeat'
        use 'matze/vim-move'
        use 'tommcdo/vim-exchange'
        use 'tpope/vim-sleuth'
        use 'tpope/vim-abolish'
        use 'tpope/vim-unimpaired'
        use 'tpope/vim-eunuch'
        use 'kopischke/vim-stay'
        use 'kopischke/vim-fetch'
        use 'mbbill/undotree'
        use 'romainl/vim-qf'
        use 'tpope/vim-fugitive'
        use 'tpope/vim-rhubarb'
        use 'liuchengxu/vista.vim'
        use {
            'trsdln/vim-grepper',
            config = function()
                vim.g.grepper = {
                    tools = {'rg', 'git'},
                    simple_prompt = 0,
                    prompt_mapping_tool = '<F10>',
                    prompt_mapping_dir = '<F11>',
                    prompt_mapping_side = '<F12>',
                }
            end,
        }
    end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
}
