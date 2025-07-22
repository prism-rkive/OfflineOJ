#!/bin/bash

now=$(date +%s)
tmp_file=$(mktemp)

problems_file="problems.txt"
contests_file="contests.txt"

declare -A unlock_list

# Step 1: Load contests that should have started
while IFS='|' read -r cname start_ts end_ts probs; do
  start_ts=$(echo "$start_ts" | xargs)
  if (( now >= start_ts )); then
    IFS=',' read -ra prob_ids <<< "$probs"
    for pid in "${prob_ids[@]}"; do
      pid=$(echo "$pid" | xargs)
      unlock_list["$pid"]=1
    done
  fi
done < "$contests_file"

# Step 2: Update problems.txt
while IFS=',' read -r id title diff status; do
  id=$(echo "$id" | xargs)
  title=$(echo "$title" | xargs)
  diff=$(echo "$diff" | xargs)
  status=$(echo "$status" | xargs)

  if [[ -n "$id" && "${unlock_list[$id]:-0}" == "1" && "$status" == "Locked" ]]; then
    echo "$id,$title,$diff,Unlocked" >> "$tmp_file"
  else
    echo "$id,$title,$diff,$status" >> "$tmp_file"
  fi
done < "$problems_file"

mv "$tmp_file" "$problems_file"
