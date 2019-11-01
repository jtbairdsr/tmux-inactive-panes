#!/usr/bin/env bash

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mode=$1
nextMode=$mode

case $mode in
	(light):
		nextMode=dark
		# shellcheck source=./set-light.sh
		. "$CWD/set-light.sh"
		;;
	(dark):
		nextMode=light
		# shellcheck source=./set-dark.sh
		. "$CWD/set-dark.sh"
		;;
esac

# shellcheck source=./helpers.sh
source "$CWD/helpers.sh"

key_binding=$(get_tmux_option "$toggle_color_option" "$default_toggle_color_key")
prefix=$(get_tmux_option "$inactive_toggle_prefix_option" "$default_inactive_toggle_prefix")


tmux set -g window-style "fg=default,bg=$inactive_bg"
tmux set -g window-active-style "fg=default,bg=$active_bg"
tmux set -g pane-border-style "fg=$inactive_fg,bg=$inactive_bg"
tmux set -g pane-active-border-style "fg=$active_fg,bg=$active_bg"

# this prevents an endless reload loop cause if we pass the second parameter then we know that this is initial
# startup...
if [ -z "$2" ]; then
	update_status_bar "$mode"
fi

new_command="$CWD/activate-mode.sh $nextMode"

if [ -z "$prefix" ]; then
	tmux bind-key -n "$key_binding" run-shell "$new_command"
else
	tmux bind-key "$key_binding" run-shell "$new_command"
fi
