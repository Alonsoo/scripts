#! /bin/bash

VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut --characters 9- | sed "s/\.//" )
# LEVEL=$(((${VOLUME#0} + 5) / 10)) # ${VOLUME#0} removes leading zero which would cause bash to interpret number as octal

TENS=$((${VOLUME#0} / 10))
UNITS=$((${VOLUME#0} % 10))

LINE="─"
INDICATOR_LEFT="╾"
INDICATOR_RIGHT="╼"
#INDICATOR_CENTER=""

OUTPUT=""

case $UNITS in
	0) INDICATOR=$INDICATOR_LEFT ;;
	5) INDICATOR=$INDICATOR_RIGHT ;;
	+) INDICATOR="?" ;;
esac

for i in {0..10}; do
	case $i in
		$TENS) OUTPUT="$OUTPUT$INDICATOR" ;;
		*) OUTPUT="$OUTPUT$LINE" ;;
	esac
done

#for i in {0..10}; do
#	#if [[ $i == $LEVEL ]]
#	case $(i) in
#		$LEVEL)
#			case $i in
#				0) INDICATOR=$INDICATOR_LEFT ;;
#				10) INDICATOR=$INDICATOR_RIGHT ;;
#				*) INDICATOR=$INDICATOR_CENTER ;;
#			esac
#			OUTPUT="$OUTPUT$INDICATOR"
#			;;
#		*) OUTPUT="$OUTPUT$LINE" ;;
#	esac
#done

echo "󰕾 $OUTPUT ${VOLUME#0}"

# ────────── 2┤├───  ─╼  ╾

# INDICATORS: Ꝋ    󰪥  󰺕    ─ ━   ├ ┼ ┤   ┠ ╂ ┨   ┣ ╋ ┫  𜱴 𜱶
