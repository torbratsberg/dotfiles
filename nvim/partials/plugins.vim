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
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-eunuch'
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim'
Plug 'torbratsberg/telescope-dir-find'
Plug 'SirVer/ultisnips'

" Themes and syntax
Plug 'kyazdani42/nvim-web-devicons'
Plug 'posva/vim-vue'
Plug 'ntk148v/vim-horizon'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

call plug#end()
