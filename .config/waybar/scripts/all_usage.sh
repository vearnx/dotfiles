#!/bin/bash
echo "  $(top -bn1 | grep 'Cpu(s)' | sed 's/.*, *\([0-9.]*\)%* id.*/\1/' | awk '{print int(100 - $1 + 0.5)}')% | $(sensors | grep 'Tctl' | sed -E 's/.*\+([0-9]+\.[0-9]+).*/\1/')°C  󰢮  $(cat /sys/class/drm/card1/device/gpu_busy_percent)% | $(sensors | grep 'edge' | head -n 1 | awk '{print $2}' | tr -d '+')   $(awk '/MemTotal/ {total=$2} /MemAvailable/ {available=$2} END {print int((1 - available/total) * 100 + 0.5)}' /proc/meminfo)%"

