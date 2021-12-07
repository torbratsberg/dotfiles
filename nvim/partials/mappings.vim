" Keyboards should have escape key on home row
imap jj <esc>

" LSP stuff
nmap <leader>cn :lua vim.lsp.buf.rename()<cr>
nmap <leader>cf :lua vim.lsp.buf.formatting()<cr>
nmap <leader>cj :lua vim.lsp.buf.hover()<cr>
nmap <leader>ca :lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor({}))<cr>
nmap <leader>cr :lua require('telescope.builtin').lsp_references(require('telescope.themes').get_cursor({}))<cr>
nmap <leader>cd :lua require('telescope.builtin').lsp_definitions(require('telescope.themes').get_cursor({}))<cr>
nmap <leader>ct :lua require('telescope.builtin').lsp_workspace_diagnostics(require('telescope.themes').get_ivy({}))<cr>
nmap <leader>cs :lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_ivy({}))<cr>

" Harpoon stuff
nmap <leader>ha :lua require("harpoon.mark").add_file()<cr>
nmap <leader>h1 :lua require("harpoon.ui").nav_file(1)<cr>
nmap <leader>h2 :lua require("harpoon.ui").nav_file(2)<cr>
nmap <leader>h3 :lua require("harpoon.ui").nav_file(3)<cr>
nmap <leader>h4 :lua require("harpoon.ui").nav_file(4)<cr>
nmap <leader>hm :lua require("harpoon.ui").toggle_quick_menu()<cr>

" Substitution commands
nmap <C-s>s :%s///g<left><left><left>
nmap <C-s>w *N:%s///g<left><left>

" Git commands
nmap <leader>gs :vertical G<cr>:vertical resize 70<cr>:set winfixwidth<cr>
nmap <leader>gbl :Git blame<cr>
nmap <leader>gbr :Telescope git_branches<cr>
nmap <leader>gd :Gdiffsplit<cr>
nmap <leader>gll :Git log<cr>
nmap <leader>gln :Git log --name-status<cr>
nmap <leader>glo :Git log --oneline<cr>
nmap <leader>gg :Git pull<cr>
nmap <leader>gp :Git push<cr>
nmap <leader>g<left> :diffget //2<cr>
nmap <leader>g<right> :diffget //3<cr>

" Looking up stuff commands
nmap <leader>f :lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({}))<cr>
nmap <leader>b :lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy({}))<cr>
nmap <leader>e :lua require('telescope.builtin').file_browser(require('telescope.themes').get_ivy({}))<cr>
nmap <leader>rl :lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<cr>
nmap <leader>rs :lua require('telescope.builtin').grep_string(require('telescope.themes').get_ivy({}))<cr>
" Customs
nmap <leader>nv :lua require('luafiles.telescope').search_config()<cr>
nmap <leader>nn :lua require('luafiles.telescope').search_notes()<cr>
nmap <leader>nb :lua require('luafiles.telescope').search_bin()<cr>
nmap <leader>nf :lua require('dirfind').search_dirs()<cr>
nmap <leader>nd :lua require('dirfind').select_dirs()<cr>

" In file movement
map <leader>a <Plug>(easymotion-bd-f)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

" Misc commands
nmap <leader>w :w<cr>
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader><leader>q :bd<cr>
tmap <leader><esc> <C-\><C-n>
nmap <leader>cc :so ~/.config/nvim/init.vim<cr>
nmap <cr> :call SelectIndent()<cr>
nmap <leader><cr> :call SelectIndentWithSpace()<cr>
nmap <tab><tab> <C-^>
nmap ª :move-2<cr>V=<esc>
nmap √ :move+1<cr>V=<esc>
vmap < < gv
vmap > > gv
nmap Y yg_
nmap n nzzzv
nmap N Nzzzv

" Character completion
imap (<tab> ()<left>
imap [<tab> []<left>
imap {<tab> {}<left>
imap '<tab> ''<left>
imap "<tab> ""<left>
inoremap {<cr> {<cr>}<esc>O

" Quickfix
nmap <leader><left> :cprev<cr>
nmap <leader><right> :cnext<cr>
