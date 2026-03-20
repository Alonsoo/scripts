#! /bin/bash


#DIR="/home/alonso/repos/scripts/statusbar"

# kill other istances of this script
#script_name=$0
to_kill="$(pgrep 'bar.sh')"
for pid in $to_kill; do
	if [ $pid != $$ ]; then
		kill $pid
	fi
done

#echo "$to_kill"
#if [ -n "$to_kill" ]; then
#	kill "$to_kill"
#fi
ROOT="/home/alonso/repos/scripts/statusbar"
while true; do
	# import pywal colrs
	. "${HOME}/.cache/wal/my-colors.sh"

	output=""
#	output+="^fg(ff00ff)$($DIR/volume.sh)   "
#	output+="^fg(ff0000)$($DIR/wifi.sh)   "
#	output+="^fg(4444ff)$($DIR/battery.sh)   "
#	output+="^fg(00ff00)$($DIR/date.sh)"

	output+="^fg($color9)"
	output+="$(cat $ROOT/status-text/volume)   "
	output+="$(cat $ROOT/status-text/wifi)   "
	output+="$(cat $ROOT/status-text/battery)   "
	output+="$(cat $ROOT/status-text/date)"

	echo "$output" | dwlb -status-stdin all
	sleep 1
done
