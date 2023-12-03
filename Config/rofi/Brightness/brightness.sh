# Theme Elements
mesg="$sicon $speaker  $micon $mic"
list_col='1'
list_row='0'

# Pass variables to rofi dmenu
run_rofi() {
	rofi -theme-str "window {width: 100;}" \
		-theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-dmenu \
		-mesg "  $(xbacklight -get)%" \
		-theme "/home/ra1n/.config/rofi/Brightness/style.rasi"
}

chosen="$(run_rofi)"
