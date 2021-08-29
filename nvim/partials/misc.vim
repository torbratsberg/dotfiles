filetype plugin indent on
autocmd FileType scss setl iskeyword+=@-@

" Since <cr> is mapped to SelectIndent(), selecting from qf list did not work
augroup CrMapFix
    autocmd!
    autocmd FileType qf nmap <buffer> <cr> <cr>
augroup END

command! FormatFile call FormatFileFunc()
function! FormatFileFunc()
    exec '%s/([ ]/(/g'
    exec '%s/[ ])/)/g'
    exec '%s/[[][ ]/[/g'
    exec '%s/[ ][]]/]/g'
    exec 'norm gg=G'
endfunction

function! SelectIndent ()
    if indent(line(".")) == 0
        exec "normal vap"
        return
    endif
    let temp_var=indent(line("."))
    while indent(line(".")-1) >= temp_var
        exec "normal k"
    endwhile
    exe "normal V"
    while indent(line(".")+1) >= temp_var
        exec "normal j"
    endwhile
endfun

" Selects indentation level including empty lines
function! SelectIndentWithSpace ()
    if indent(line(".")) == 0
        exec "normal vap"
        return
    endif
    let temp_var=indent(line("."))
    while indent(line(".")-1) >= temp_var || (indent(line(".")-1) == 0 && strwidth(getline(line(".")-1)) == 0)
        exec "normal k"
    endwhile
    exe "normal V"
    while indent(line(".")+1) >= temp_var || (indent(line(".")+1) == 0 && strwidth(getline(line(".")+1)) == 0)
        exec "normal j"
    endwhile
endfun

nmap <Leader>. :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" JS Stuff
command! ReactComponent call ReactComponentTemplate()
function! ReactComponentTemplate()
    read ~/.config/nvim/templates/react-component.txt
    exec '%s/<++>/' . expand('%:t:r') . '/ge'
endfunction

command! RunJS call RunJSFunc()
function RunJSFunc()
	exec 'vs'
	exec 'terminal node ' . expand('%:p')
endfunction
