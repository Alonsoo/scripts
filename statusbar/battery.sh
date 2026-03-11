#! /bin/bash


bat_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
bat_status=$(cat /sys/class/power_supply/BAT0/status)

case $bat_status in
	"Charging") icon="󱊦" ;;
	"Discharging") icon="󱊣" ;;
	"Full") icon="󱊣" ;;
	*) icon="?" ;;
esac

echo "$icon $bat_capacity%"
