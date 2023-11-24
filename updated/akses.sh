#!/bin/bash

# Path to the log file
log_file="/var/log/xray/access.log"

# Extract unique admin emails
unique_admins=$(awk '/email:/{print $NF}' "$log_file" | sort -u)

# Display the results
for admin_email in $unique_admins; do
    echo "Username: $admin_email"
    echo "-----------------------------------"
    grep -w "email: $admin_email" "$log_file" | grep "accepted" | awk '{split($3, a, ":"); print a[1]}' | sort -u
    echo
done
