return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Colorschemes
    use { 'mhartington/oceanic-next' }
    use { 'rebelot/kanagawa.nvim' }

    -- Functionality
    use { 'tpope/vim-fugitive' }
    use { 'mattn/emmet-vim' }
    use { 'tpope/vim-surround' }
    use { 'iamcco/markdown-preview.nvim' }
    use { 'easymotion/vim-easymotion', }
    use {
        'ThePrimeagen/harpoon',
        requires = { "nvim-lua/plenary.nvim" }
    }
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { 'javascript', 'lua', 'scss', 'vim', 'go', 'vue' },
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
