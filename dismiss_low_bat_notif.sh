#!/bin/bash
path="$HOME/.cache/waybar/low_bat_notif_id"
if [ ! -f "$path" ]; then
	exit 0
fi

while read -r line; do
	makoctl dismiss -n "$line"
done < "$path"

rm "$path"

