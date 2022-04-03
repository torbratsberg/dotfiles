call plug#begin('~/.config/nvim/plugged')

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Lsp stuff
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'neovim/nvim-lspconfig'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Functionality
Plug 'tpope/vim-fugitive'
Plug 'numToStr/Comment.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-eunuch'
Plug 'SirVer/ultisnips'
Plug 'ThePrimeagen/harpoon'
Plug 'tpope/vim-surround'
Plug 'github/copilot.vim'
Plug 'iamcco/markdown-preview.nvim'
Plug 'ggandor/lightspeed.nvim'

" Colorschemes
Plug 'catppuccin/nvim'

call plug#end()
