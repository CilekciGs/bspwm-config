speaker="`amixer get Master | tail -n1 | awk -F ' ' '{print $5}' | tr -d '[]'`"
mic="`amixer get Capture | tail -n1 | awk -F ' ' '{print $5}' | tr -d '[]'`"

# Speaker Info
amixer get Master | grep '\[on\]' &>/dev/null
if [[ "$?" == 0 ]]; then
	#active="-a 1"
	stext='Unmuted'
	sicon=''
else
	#urgent="-u 1"
	stext='Muted'
	sicon=''
fi

# Microphone Info
amixer get Capture | grep '\[on\]' &>/dev/null
if [[ "$?" == 0 ]]; then
    #[ -n "$active" ] && active+=",3" || active="-a 3"
	mtext='Unmuted'
	micon=''
else
    #[ -n "$urgent" ] && urgent+=",3" || urgent="-u 3"
	mtext='Muted'
	micon=''
fi

# Theme Elements
mesg="$sicon $speaker  $micon $mic"
list_col='1'
list_row='0'

# Pass variables to rofi dmenu
run_rofi() {
	rofi -theme-str "window {width: 164;}" \
		-theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-dmenu \
		-mesg "$mesg" \
		-theme "/home/ra1n/.config/rofi/Volume/style.rasi"
}

chosen="$(run_rofi)"
