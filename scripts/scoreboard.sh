#!/bin/bash


cname=$1
uname=$2
verdict=$3  # "Accepted" or "Rejected"
timestamp=$4
pid=$5

scorecard_file="contests/scorecard_${cname}.txt"
contest_file="contests.txt"
submission_file="submission.txt"

#DONT UPDATE SCOREBOARD
contest_line=$(grep "^$cname|" "$contest_file")
problem_list=$(echo "$contest_line" | cut -d'|' -f4)
if ! echo "$problem_list" | grep -qw "$pid"; then
    echo "[DEBUG] Problem $pid is not in contest problem list: $problem_list"
    # echo "Problem $problem_id is not part of contest $cname. Ignored."
    exit 0
fi

# Get contest end time from contests.txt
end_time=$(grep "^$cname|" "$contest_file" | cut -d'|' -f3)

# Convert timestamp to epoch for comparison
submission_epoch=$(date -d "$timestamp" +"%s")

# Reject if submission is after contest end time
if (( submission_epoch > end_time )); then
    echo "Submission after contest end time."
    echo "[DEBUG] Submission epoch = $submission_epoch, End time = $end_time"

    exit 0
fi

# Check if already accepted this problem
if grep -q "^$uname,$pid,AC" "$submission_file"; then
    echo "[DEBUG] Checking if $uname already submitted AC for problem $pid"

    exit 0
fi
echo "$uname,$pid,$verdict,$timestamp" >> submission.txt 


# Check if user exists in scorecard
if grep -q "^$uname," "$scorecard_file"; then
    # Extract old values
    line=$(grep "^$uname," "$scorecard_file")
    points=$(echo "$line" | cut -d',' -f2)
    solved=$(echo "$line" | cut -d',' -f3)

    # Update based on verdict
    if [[ "$verdict" == "AC" ]]; then
        points=$((points + 20))
        solved=$((solved + 1))
    else
        points=$((points - 3))
    fi

    # Replace line
    sed -i "s/^$uname.*/$uname,$points,$solved,$timestamp/" "$scorecard_file"

else
    # New user
    if [[ "$verdict" == "AC" ]]; then
        points=20
        solved=1
    else
        points=-3
        solved=0
    fi
    echo "$uname,$points,$solved,$timestamp" >> "$scorecard_file"
fi
sort -t',' -k3,3nr -k2,2nr -k4,4 "$scorecard_file" -o "$scorecard_file"
