# tmux-inactive-panes
dim tmux panes that are currently inactive

This defaults to a solarized colorscheme but can be customized to match your colorscheme. Includes support for switching
between light and dark verions of the color scheme on the fly.


## options
| Option                   | Description                                           | Default  |
| ------------------------ | :---------------------------------------------------: | -------: |
| @default-inactive-color  | set the default color scheme                          | light    |
| @toggle-inactive-color   | assign a key to change light to dark colors           | F2       |
| @toggle-inactive-prefix  | whether the toggle keybinding will use the prefix key | ""       |
| @active-bg-color-dark    | background color of active panes (dark)               | colour8  |
| @active-fg-color-dark    | foreground color of active panes borders (dark)       | colour12 |
| @active-bg-color-light   | background color of active panes (light)              | colour15 |
| @active-fg-color-light   | foreground color of active panes borders (light)      | colour11 |
| @inactive-bg-color-dark  | background color of inactive panes (dark)             | colour0  |
| @inactive-fg-color-dark  | foreground color of inactive pane borders (dark)      | color10  |
| @inactive-bg-color-light | background color of inactive panes (light)            | colour7  |
| @inactive-fg-color-light | foreground color of inactive pane borders (light)     | colour14 |


##dependencies
requires neovim-remote on the users path in order to update current instantces of neovim
