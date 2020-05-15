#!/bin/sh

# terminate already running instances
killall -q waybar

# wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 1; done

# launch
waybar
