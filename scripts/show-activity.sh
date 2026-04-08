#!/usr/bin/env bash
# Show activity stats with dynamic year in title
YEAR=$(date +%Y)
termgraph data/activity.dat --title "Activity YTD $YEAR" --color green --width 20 --format '{:.0f}'
