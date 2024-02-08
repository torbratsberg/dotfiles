return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Colorschemes
    use { 'rebelot/kanagawa.nvim' }
    use { 'sainnhe/gruvbox-material' }

    -- Functionality
    use { 'tpope/vim-fugitive' }
    use { 'mattn/emmet-vim' }
    use { 'tpope/vim-surround' }
    use { 'easymotion/vim-easymotion', }
    use {
        'ggandor/leap.nvim',
        config = function() require('leap').add_default_mappings() end
    }
    use {
        'stevearc/oil.nvim',
        config = function() require('oil').setup() end
    }
    use {
        'ThePrimeagen/harpoon',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }
    use {
        "beauwilliams/focus.nvim",
        config = function() require("focus").setup({ cursorline = false }) end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup({
                options = {
                    icons_enabled = false,
                    theme = 'horizon',
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                    refresh = {
                        statusline = 1000,
                    }
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics'},
                    lualine_c = { 'filename' },
                    lualine_x = { 'encoding', 'filesize' },
                    lualine_y = { 'filetype', 'progress' },
                    lualine_z = { 'fileformat', 'location' }
                },
                inactive_sections = {
                    lualine_a = { },
                    lualine_b = { },
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = { },
                    lualine_z = { }
                },
                tabline = {
                    lualine_c = { '%f' }
                },
            })
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        -- run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { 'javascript', 'lua', 'scss', 'vim', 'go', 'sql', 'typescript', 'html' },
                highlight = { enable = true },
                indent = { enable = false, }
            })
        end 
    }

    -- Telescope
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use {
        'nvim-telescope/telescope.nvim',
        config = function()
            require('telescope').setup{
                defaults = {
                    file_ignore_patterns = {
                        '%.png',
                        '%.otf',
                        '%.jpg',
                        '%.jpeg',
                        '%.woff',
                        '%.woff2',
                        '%.ttf',
                        '%.eot',
                        '%.map',
                        '%.po',
                    },
                    file_sorter = require('telescope.sorters').get_fzy_sorter,
                },
                extensions = {
                    fzy_native = {
                        override_generic_sorter = false,
                        override_file_sorter = true,
                    }
                }
            }
        end
    }

    -- Lsp stuff
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-path' }
    use { 'neovim/nvim-lspconfig' }
    use { 'L3MON4D3/LuaSnip' }
    use { 'saadparwaiz1/cmp_luasnip' }
end)
