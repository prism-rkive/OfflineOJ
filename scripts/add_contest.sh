#!/bin/bash

CONTESTS_LIST="contests.txt"

echo "=== Add Contest ==="
read -p "Contest name: " cname
read -p "Problems (comma separated, e.g. problemA,problemB): " probs  #egulake used mark
read -p "Start time (YYYY-MM-DD HH:MM): " start
read -p "End time (YYYY-MM-DD HH:MM): " end


start_ts=$(date -d "$start" +%s)
end_ts=$(date -d "$end" +%s)

if [[ -z "$cname" || -z "$probs" || -z "$start" || -z "$end" ]]; then
  echo "❌ All fields are required."
  exit 1
fi

echo "$cname|$start_ts|$end_ts|$probs" >>contests.txt
#creating a scorecard for contest
touch contests/scorecard_${cname}.txt



# === Lock selected problems immediately ===
CONTESTS_LIST="contests.txt"
PROBLEMS_FILE="problems.txt"
TMP_FILE=$(mktemp)
IFS=',' read -ra prob_ids <<< "$probs"

# Read and update problems.txt
while IFS=',' read -r id title diff status; do
  id=$(echo "$id" | xargs)
  title=$(echo "$title" | xargs)
  diff=$(echo "$diff" | xargs)
  status=$(echo "$status" | xargs)

  found=0
  for pid in "${prob_ids[@]}"; do
    pid=$(echo "$pid" | xargs)
    if [[ "$id" == "$pid" && "$status" != "Unlocked" ]]; then
      echo "$id,$title,$diff,Locked" >> "$TMP_FILE"
      found=1
      break
    fi
  done

  if [[ $found -eq 0 ]]; then
    echo "$id,$title,$diff,$status" >> "$TMP_FILE"
  fi
done < "$PROBLEMS_FILE"

mv "$TMP_FILE" "$PROBLEMS_FILE"

echo "✅ Contest '$cname' created successfully!"



