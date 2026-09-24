#!/bin/bash 
# KNH analysis of live data from the active_logs 
# Clinical analyst function
process_vitals() {
    echo "Parsing vital datasets for CRITICAL patient emergencies..."
    mkdir -p reports

    # Define log paths for cleanliness
    local hr_log="active_logs/heart_rate_log.log"
    local temp_log="active_logs/temperature_log.log"
    local output_file="reports/critical_alerts.txt"
}
 if [ -f "$hr_log" ] && [ -f "$temp_log" ]; then

        # Grep finds CRITICAL rows; awk strictly cleans up fields using ' | ' separator
        grep -h "CRITICAL" "$hr_log" "$temp_log" | \
        awk -F ' \| ' '{print $1 " | Device: " $2 " | Value: " $3}' > "$output_file"


        echo "Emergency warnings safely stored in $output_file."
        echo "Total critical events recorded: $(wc -l < "$output_file")"
    else
        echo "ERROR: Expected log files not found in active_logs/."
    fi
}
