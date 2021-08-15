# torbratsberg ZSH Theme
# %m for computer name

# PROMPT='
# %{$fg[cyan]%}%n$reset_color%\ | %{$fg_bold[green]%}%3~%{$reset_color%} | $(git_prompt_info)
# ${fg[red]}%{%T%}%{$reset_color%} %{%(!.${fg[red]}.${fg[white]})%}>%{$reset_color%} '

PROMPT='
%{$fg[cyan]%}%n$reset_color%\ | %{$fg_bold[green]%}%3~%{$reset_color%} | $(git_prompt_info)
%{%(!.${fg[red]}.${fg[red]})%}>%{$reset_color%} '

# Git prompt settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}X%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[blue]%}-%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$fg[blue]%}+%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$fg[yellow]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$fg[red]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$fg[blue]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$fg[cyan]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[white]%}%{$reset_color%}"

# LS colors, made with https://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='di=1;34:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export GREP_COLOR='1;33'
