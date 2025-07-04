return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'github/copilot.vim'

    -- Colorschemes
    use { 'morhetz/gruvbox' }

    -- Functionality
    use { 'tpope/vim-fugitive' }
    use { 'mattn/emmet-vim' }
    use { 'tpope/vim-surround' }
    use { "folke/zen-mode.nvim" }
    use { 'ggandor/leap.nvim', config = function() require('leap').add_default_mappings() end }
    use { 'stevearc/oil.nvim', config = function() require('oil').setup() end }
    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
    use {
        'nvim-treesitter/nvim-treesitter',
        -- run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { 'javascript', 'lua', 'scss', 'vim', 'sql', 'typescript', 'html' },
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
                        '%.jpg',
                        '%.jpeg',
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
