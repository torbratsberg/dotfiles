call plug#begin('~/.config/nvim/plugged')

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Functionality
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-eunuch'
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim'
Plug 'torbratsberg/telescope-dir-find'

" Themes and syntax
Plug 'kyazdani42/nvim-web-devicons'
Plug 'posva/vim-vue'
Plug 'ntk148v/vim-horizon'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

call plug#end()
