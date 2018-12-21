#!/usr/bin/env bash

# helper functions
get_tmux_option() {
	local option default_value option_value

	option="$1"
	default_value="$2"
	option_value=$(tmux show-option -gqv "$option")

	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

update_status_bar() {
	ex "+%s/@colors-solarized.*/@colors-solarized '$1'" -scwq ~/.tmux.conf
 	ex "+%s/set background=.*/set background=$1/ge" -scwq ~/.config/nvim/init.vim
	# rm ~/.tmux.conf.bak
	# tmux set -g @colors-solarized "$1"

	local servers nvim_command

	nvim_command=":set background=$1"

	servers="$(nvr --serverlist)"

	for server in $servers; do
		nvr -s --nostart --servername "$server" -c "$nvim_command"
	done

	nvim --headless --cmd 'let colorchange=1' -c "$nvim_command | TmuxlineSnapshot! ~/.tmux-line.conf | qall"
	tmux source-file ~/.tmux.conf

}
