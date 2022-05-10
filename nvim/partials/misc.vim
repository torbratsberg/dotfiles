filetype plugin indent on
autocmd FileType scss setl iskeyword+=@-@

function! SelectIndent()
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
function! SelectIndentWithSpace()
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

" JS Stuff
command! NewReactComponent call NewReactComponentFunc()
function! NewReactComponentFunc()
    read ~/.config/nvim/templates/react-component.txt
    exec '%s/<++>/' . expand('%:t:r') . '/ge'
endfunction

command! GetIP :!echo $(ipconfig getifaddr en0)<cr>
