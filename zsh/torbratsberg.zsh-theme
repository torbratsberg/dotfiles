# torbratsberg ZSH Theme
# This is just dstufft but with the time in first line

ZSH_THEME="../../.config/zsh/torbratsberg"

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '+' && return
    echo '○'
}

function get_git_branch {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function prompt_end {
	# If not in git repo, return empty string
	local git_branch=$(get_git_branch)
	if [ -n "$git_branch" ]; then
		echo " | "
		else echo ""
	fi
}

# PROMPT='
# %{$fg[magenta]%}%n%{$reset_color%} in %{$fg_bold[yellow]%}%~%{$reset_color%} at %{$fg[red]%}%{%T%}%{$reset_color%}$(git_prompt_info)
# $(virtualenv_info)$(prompt_char) '

# %{$fg[red]%}%{%T%}%{$reset_color%}|%{$fg[magenta]%}%n%{$reset_color%}|%{$fg_bold[yellow]%}%~%{$reset_color%}|%{$fg[magenta]%}$(git_current_branch)%{$reset_color%} ○ '
PROMPT='
%{$fg[red]%}%{%T%}%{$reset_color%} | %{$fg_bold[yellow]%}%~%{$reset_color%} | %{$fg[magenta]%}$(get_git_branch)%{$reset_color%}$(prompt_end)$(prompt_char) '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
