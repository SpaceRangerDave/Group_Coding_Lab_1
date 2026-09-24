#!/bin/bash
# KNH log rotation script
# written by member 4 (The Archivist)

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
mkdir -p archived_logs
echo "Starting log rotation at $TIMESTAMP..."

declare -A HEADERS
HEADERS["heart"]="Timestamp | Device_ID | Heart_Rate (BPM) | Status"
HEADERS["temp"]="Timestamp | Device_ID | Temperature (Celsius) | Status"
HEADERS["water"]="Timestamp | Device_ID | Usage (Liters/min) | Status"

for logfile in heart_rate_log temperature_log water_usage_log; do
    if [ -f "active_logs/${logfile}.log" ]; then
        echo "Archiving ${logfile}.log..."

        mv "active_logs/${logfile}.log" "archived_logs/${logfile}_${TIMESTAMP}.log"

        case "$logfile" in
            heart_rate_log)   prefix="heart" ;;
            temperature_log)  prefix="temp"  ;;
            water_usage_log)  prefix="water" ;;
        esac

        echo "${HEADERS[$prefix]}" > "active_logs/${logfile}.log"
    fi
done

echo "Log rotation complete."
