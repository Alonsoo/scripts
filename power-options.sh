#!/usr/bin/env bash

#case "$(printf "kill\nlogout\nzzz\nreboot\nshutdown" | wmenu-colors -i -c -l 5)" in
case "$(printf "kill\nlogout\nzzz\nreboot\nshutdown" | rofi -dmenu -i  -l 5 -theme-str 'configuration{show-icons:false;font:"mono 12";}*{accent: @color4;accent-bg: @color12-t;}window{width: 350;}inputbar{enabled:false;}listview{border:0;}element{padding:2;}')" in
#	kill) ps -u "$USER" -o pid,comm,%cpu,%mem | wmenu-colors -i -c -l 10 -p Kill: | awk '{print $1}' | xargs -r kill ;;
	kill) ps -u "$USER" -o pid,comm,%cpu,%mem | rofi -dmenu -i -l 10 -p "Kill: " -theme-str "configuration{show-icons: false; font: 'mono 10';}*{accent: @color4;accent-bg: @color12-t;}element{padding: 2;}" | awk '{print $1}' | xargs -r kill ;;
	logout) echo TODO;;
	zzz) systemctl suspend ;;
	reboot) systemctl reboot -i ;;
	shutdown) shutdown now ;;
	*) exit 1 ;;
esac
