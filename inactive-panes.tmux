#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# shellcheck source=./scripts/variables.sh
. "$CURRENT_DIR/scripts/variables.sh"
# shellcheck source=./scripts/helpers.sh
. "$CURRENT_DIR/scripts/helpers.sh"

colorscheme=$(get_tmux_option "$inactive_colorscheme_option" "$default_inactive_colorscheme")

if [ "$colorscheme" == 'light' ]; then
	# shellcheck source=./scripts/helpers.sh
	. "$CURRENT_DIR/scripts/activate-light-mode.sh" 1
else
	# shellcheck source=./scripts/helpers.sh
	. "$CURRENT_DIR/scripts/activate-dark-mode.sh" 1
fi

