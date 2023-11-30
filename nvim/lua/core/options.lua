local set = vim.opt

set.colorcolumn = '80'
set.completeopt = 'menu,noinsert,noselect'
set.hidden = false
set.history = 400
set.laststatus = 2
set.lazyredraw = true
set.hlsearch = false
set.swapfile = false
set.wrap = false
set.writebackup = false
set.path = '**'
set.relativenumber = true
set.scrolloff = 8
set.sidescrolloff = 20
set.smartindent = true
set.splitbelow = true
set.splitright = true
set.signcolumn = 'no'
set.grepprg = 'rg --vimgrep --hidden --ignore-file ~/.rg-gitignore'
set.guifont = 'Meslo:h15'
set.guicursor = 'a:blinkoff0-block'
set.termguicolors = true
set.expandtab = true
set.showtabline = 2
set.cursorline = false

-- Misc settings
vim.cmd('syntax on')
vim.cmd('colorscheme kanagawa-dragon')
vim.cmd('filetype plugin indent on')
vim.cmd('autocmd FileType scss setl iskeyword+=@-@')
