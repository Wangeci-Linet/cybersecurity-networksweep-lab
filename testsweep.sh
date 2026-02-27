#!/bin/bash

# Check if subnet argument is provided
if [ $# -eq 0 ]; then
        echo "Usage: $0 <subnet>"
        echo "Example: $0 192.168.1"
        exit 1
fi

SUBNET=$1
OUTPUT_FILE="sweep_results.txt"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "========================================="
echo "Network Sweep Started: $DATE"
echo "Target Subnet: $SUBNET.0/24"
echo "========================================="

# Sweep from .1 to .254
for i in $(seq 1 254); do
        IP="$SUBNET.$i"
        # Ping with timeout of 1 second, 1 packet
        ping -c 1 -W 1 $IP > /dev/null 2>&1

        if [ $? -eq 0 ]; then
                echo "[ALIVE] $IP is responsive"
                echo "$IP" >> $OUTPUT_FILE
        fi
done

echo "========================================="
echo "Sweep completed."
echo "Active hosts found:"
echo "Results saved to: $OUTPUT_FILE"
echo "========================================="

# Display only discovered IP addresses
grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' "$OUTPUT_FILE"
