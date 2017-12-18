#!/usr/bin/env bash

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# shellcheck source=./variables.sh
source "$CWD/variables.sh"
# shellcheck source=./helpers.sh
source "$CWD/helpers.sh"

key_binding=$(get_tmux_option "$toggle_color_option" "$default_toggle_color_key")
prefix=$(get_tmux_option "$inactive_toggle_prefix_option" "$default_inactive_toggle_prefix")

active_bg=$(get_tmux_option "$active_bg_color_dark_option" "$default_active_bg_color_dark")
active_fg=$(get_tmux_option "$active_fg_color_dark_option" "$default_active_fg_color_dark")
inactive_bg=$(get_tmux_option "$inactive_bg_color_dark_option" "$default_inactive_bg_color_dark")
inactive_fg=$(get_tmux_option "$inactive_fg_color_dark_option" "$default_inactive_fg_color_dark")

tmux set -g window-style "fg=default,bg=$inactive_bg"
tmux set -g window-active-style "fg=default,bg=$active_bg"
tmux set -g pane-border-bg "$inactive_bg"
tmux set -g pane-border-fg "$inactive_fg"
tmux set -g pane-active-border-bg "$active_bg"
tmux set -g pane-active-border-fg "$active_fg"

if [ -z "$1" ]; then
	update_status_bar dark
fi

new_command="$CWD/activate-light-mode.sh"
if [ -z "$prefix" ]; then
	tmux bind-key -n "$key_binding" run-shell "$new_command"
else
	tmux bind-key "$key_binding" run-shell "$new_command"
fi

