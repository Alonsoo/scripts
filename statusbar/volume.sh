#! /bin/bash

VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut --characters 9- | sed "s/\.//" )

TENS=$((${VOLUME#0} / 10)) # ${VOLUME#0} removes leading zero which would cause bash to interpret number as octal
UNITS=$((${VOLUME#0} % 10))

LINE="─"
INDICATOR_LEFT="╾"
INDICATOR_RIGHT="╼"
#INDICATOR_CENTER=""

OUTPUT=""

case $UNITS in
	[0-4]) INDICATOR=$INDICATOR_LEFT ;;
	[5-9]) INDICATOR=$INDICATOR_RIGHT ;;
	+) INDICATOR="?" ;;
esac

for i in {0..10}; do
	case $i in
		$TENS) OUTPUT="$OUTPUT$INDICATOR" ;;
		*) OUTPUT="$OUTPUT$LINE" ;;
	esac
done

headphones_plugged() {
	amixer -c 0 cget iface=CARD,name='Headphone Jack' 2>/dev/null | grep -q "values=on"
}
bluetooth_connected() {
	pactl info | grep "Default Sink" | grep -q "bluez"
}
usb_audio() {
	pactl info | grep "Default Sink" | grep -q "usb"
}

ICON="?"
if bluetooth_connected; then
	ICON=""
elif usb_audio; then
	ICON="󰗅"
elif headphones_plugged; then
	ICON="󰋋"
else
	ICON="󰕾"
fi


echo "$ICON $OUTPUT ${VOLUME#0}"

# ────────── 2┤├───  ─╼  ╾

# INDICATORS: Ꝋ    󰪥  󰺕    ─ ━   ├ ┼ ┤   ┠ ╂ ┨   ┣ ╋ ┫  𜱴 𜱶
