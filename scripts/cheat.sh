#!/usr/bin/env bash
selected=`cat ~/.config/scripts/langs.txt ~/.config/scripts/utils.txt | fzf`
read -p "query: " query

if grep -qs "$selected" ~/.config/scripts/langs.txt; then
# if $langs | grep -qs $selected; then
	query=`echo $query | tr ' ' '+'`
	tmux neww bash -c "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
	query=`echo $query | tr ' ' '+'`
	tmux neww bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
