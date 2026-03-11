#!/bin/bash

# Kill previous instances. I should really check how to handle this properly
kill $(pgrep "loop")

ROOT="/home/alonso/repos/scripts/statusbar"
# output to temp file then rename to avoid race conditions
"$ROOT"/loop.sh "$ROOT/volume.sh > $ROOT/status-text/temp-volume; mv $ROOT/status-text/temp-volume $ROOT/status-text/volume" 1 & 
"$ROOT"/loop.sh "$ROOT/wifi.sh > $ROOT/status-text/temp-wifi; mv $ROOT/status-text/temp-wifi $ROOT/status-text/wifi" 5 &
"$ROOT"/loop.sh "$ROOT/battery.sh > $ROOT/status-text/temp-battery; mv $ROOT/status-text/temp-battery $ROOT/status-text/battery" 30 &
"$ROOT"/loop.sh "$ROOT/date.sh > $ROOT/status-text/temp-date; mv $ROOT/status-text/temp-date $ROOT/status-text/date" 1 &
