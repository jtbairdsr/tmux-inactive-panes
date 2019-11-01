#!/usr/bin/env bash

if [ -z "$(tmux show-option -gqv @tmux-inactive-panes-initialized)" ]; then
	CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

	# shellcheck source=./scripts/variables.sh
	. "$CURRENT_DIR/scripts/variables.sh"
	# shellcheck source=./scripts/helpers.sh
	. "$CURRENT_DIR/scripts/helpers.sh"

	inactiveColorscheme=$(get_tmux_option "$inactive_colorscheme_option" "$default_inactive_colorscheme")

	# shellcheck source=./scripts/activate-mode.sh
	. "$CURRENT_DIR/scripts/activate-mode.sh $inactiveColorscheme" 1

	tmux set -g @tmux-inactive-panes-initialized 1
fi

