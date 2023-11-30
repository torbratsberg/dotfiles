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

menu Main.OpenJira :lua OpenWord('jira')<cr>
menu Main.OpenGithub :lua OpenWord('github')<cr>

menu SwapApi.Development :lua SwapAPI('dev')<cr>
menu SwapApi.Local :lua SwapAPI('local')<cr>
menu SwapApi.BetaSQL :lua SwapAPI('betasql')<cr>

autocmd ColorScheme * lua require('leap').init_highlight(true)
