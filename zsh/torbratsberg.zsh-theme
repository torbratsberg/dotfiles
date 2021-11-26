# torbratsberg ZSH Theme
# This is just dstufft but with the time in first line

ZSH_THEME="../../.config/zsh/torbratsberg"

PROMPT='
%{$fg[red]%}%{%T%}%{$reset_color%} in %{$fg_bold[yellow]%}%~%{$reset_color%}$(git_prompt_info) - '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
