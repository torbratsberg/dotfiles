let g:theme = 'tokyo'

syntax on
set background=dark
set guifont=Meslo:h15
set guicursor=a:blinkoff0-block
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

if g:theme == 'horizon'
    colorscheme horizon
    hi! Pmenu guibg=#6c6f93
    hi! Cursor guifg=#000000 guibg=#e95678
    hi! htmlTagName gui=italic guifg=#21bfc2
    hi! Statement cterm=italic gui=italic ctermfg=171 guifg=#b877db
    hi! Visual gui=bold guibg=#2b2e3b guifg=#09f7a0
    hi! link TabLineFill Character
    hi! link TabLine Folded
    hi! link TabLineSel Directory
	" Make vim background transparent
	hi! Normal guibg=NONE
	hi! EndOfBuffer guibg=NONE
	hi! LineNr guibg=NONE
	hi! SignColumn guibg=NONE
	hi! VertSplit guibg=NONE
	hi! VertSplit guibg=NONE
elseif g:theme == 'tokyo'
	let g:tokyonight_style="night"
	colorscheme tokyonight
endif
