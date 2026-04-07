#!/usr/bin/env bash
# Output RAM usage percentage (Linux)
while read -r key val _; do
  case "$key" in
    MemTotal:)  total=$val ;;
    MemAvailable:) avail=$val ;;
  esac
done < /proc/meminfo
used=$(( total - avail ))
printf "%.0f%%" $(echo "scale=1; $used * 100 / $total" | bc)
