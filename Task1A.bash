#!/usr/bin/env bash

LOG_FILE=$1
LOWER_LIMIT=400
UPPER_LIMIT=599
MAX_COUNT=100
INTERVAL=1h

while true
do 
    COUNT=$(awk -v LOWER_LIMIT="$LOWER_LIMIT" -v UPPER_LIMIT="$UPPER_LIMIT" ' $9 >= LOWER_LIMIT && $9 <= UPPER_LIMIT { print NR". " $9 }' $LOG_FILE | wc -l)
    echo "Number of HTTP 4xx and 5xx response statuses: $COUNT"
    if [[ $COUNT -gt $MAX_COUNT ]]; then
    echo "send email as exceed $MAX_COUNT" | mail -s "Apache logs exceed $MAX_COUNT" user@email.com
    fi
    echo $(date)
    sleep $INTERVAL

done