#!/bin/bash

# ==============================================================================
# Script Name: node_health.sh
# Description: Basic system health check for blockchain validator nodes.
# Author: Matthew Robert Carner
# ==============================================================================

# 1. Set Thresholds
DISK_THRESHOLD=80
CHECK_URL="8.8.8.8" # Google DNS to check connectivity

echo "--- Starting Node Health Check: $(date) ---"

# 2. Check Disk Usage
# We use 'df' to see disk space and 'awk' to grab the percentage of the root (/) partition.
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    echo "[ALERT] Disk usage is high: ${DISK_USAGE}%"
else
    echo "[OK] Disk usage is at ${DISK_USAGE}%"
fi

# 3. Check Memory Usage
# 'free -m' shows memory in MB; we calculate the percentage used.
MEM_FREE=$(free -m | awk 'NR==2 {print $4}')
echo "[INFO] Free Memory: ${MEM_FREE}MB"

# 4. Check Connectivity
# 'ping' once; if it fails, the node might be offline.
if ping -c 1 "$CHECK_URL" > /dev/null 2>&1; then
    echo "[OK] Internet connectivity is active."
else
    echo "[ALERT] Network is unreachable! Check your router/connection."
fi

echo "--- Health Check Complete ---"
