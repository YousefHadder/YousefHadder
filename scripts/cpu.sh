#!/usr/bin/env bash
# Output CPU usage percentage (Linux)
read -r cpu_line < /proc/stat
set -- $cpu_line
total=$(( $2+$3+$4+$5+$6+$7+$8 ))
idle=$5
if [ -f /tmp/.cpu_prev ]; then
  read prev_total prev_idle < /tmp/.cpu_prev
  diff_total=$(( total - prev_total ))
  diff_idle=$(( idle - prev_idle ))
  if [ $diff_total -gt 0 ]; then
    printf "%.0f%%" $(echo "scale=1; (1 - $diff_idle/$diff_total) * 100" | bc)
  else
    echo "0%"
  fi
else
  echo "0%"
fi
echo "$total $idle" > /tmp/.cpu_prev
