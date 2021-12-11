call plug#begin('~/.config/nvim/plugged')

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Lsp stuff
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'neovim/nvim-lspconfig'

" Functionality
Plug 'tpope/vim-fugitive'
Plug 'numToStr/Comment.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-eunuch'
Plug 'torbratsberg/telescope-dir-find'
Plug 'SirVer/ultisnips'
Plug 'ThePrimeagen/harpoon'
Plug 'tpope/vim-surround'
Plug 'github/copilot.vim'

" Themes and syntax
Plug 'kyazdani42/nvim-web-devicons'
Plug 'posva/vim-vue'
Plug 'gruvbox-community/gruvbox'
Plug 'folke/tokyonight.nvim', {'branch': 'main'}

call plug#end()
