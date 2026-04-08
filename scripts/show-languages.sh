#!/usr/bin/env bash
# Show language stats with dynamic year in title
YEAR=$(date +%Y)
termgraph data/languages.dat --title "Languages YTD $YEAR (by commits)" --color cyan --width 20 --format '{:.0f}' --suffix ' commits'
