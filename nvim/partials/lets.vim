let g:netrw_banner=0
let g:netrw_winsize=20
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_altv=1

let g:python_host_prog  = '/usr/bin/python'
let g:python3_host_prog  = '/usr/local/bin/python3'

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

let mapleader=" "
let leader=" "

let g:user_emmet_leader_key='<C-l>'

" Use , instead of ; in EasyMotion search for ISO layout convenience
let g:EasyMotion_keys = get(g:, 'EasyMotion_keys', 'asdghklqwertyuiopzxcvbnmfj,')
