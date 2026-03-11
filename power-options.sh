#!/usr/bin/env bash

case "$(printf "kill\nlogout\nzzz\nreboot\nshutdown" | wmenu -i -c -l 5)" in
	kill) ps -u "$USER" -o pid,comm,%cpu,%mem | wmenu -i -c -l 10 -p Kill: | awk '{print $1}' | xargs -r kill ;;
	logout) echo TODO;;
	zzz) systemctl suspend ;;
	reboot) systemctl reboot -i ;;
	shutdown) shutdown now ;;
	*) exit 1 ;;
esac
