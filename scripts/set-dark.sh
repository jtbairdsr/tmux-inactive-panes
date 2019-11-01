#!/usr/bin/env bash

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# shellcheck source=./variables.sh
source "$CWD/variables.sh"

# shellcheck source=./helpers.sh
source "$CWD/helpers.sh"

export active_bg
export active_fg
export inactive_bg
export inactive_fg

active_bg=$(get_tmux_option "$active_bg_color_dark_option" "$default_active_bg_color_dark")
active_fg=$(get_tmux_option "$active_fg_color_dark_option" "$default_active_fg_color_dark")
inactive_bg=$(get_tmux_option "$inactive_bg_color_dark_option" "$default_inactive_bg_color_dark")
inactive_fg=$(get_tmux_option "$inactive_fg_color_dark_option" "$default_inactive_fg_color_dark")
