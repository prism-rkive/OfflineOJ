#!/bin/bash

cname=$1 #add this to user dashboard and also from login dashboard
uname=$2

# Path config
CONTEST_FILE="../contests.txt"
PROBLEMS_FILE="../problems.txt"
SCORECARD_FILE="../contests/scorecard_${cname}.txt"

# Get problem list from contests.txt
problem_line=$(grep "^$cname|" "$CONTEST_FILE")
if [[ -z "$problem_line" ]]; then
  echo "❌ Contest '$cname' not found!"
  exit 1
fi

# Extract problems from line
problem_ids=$(echo "$problem_line" | cut -d'|' -f4 | tr ',' '\n' | sed 's/^ *//;s/ *$//')

while true; do
  echo
  echo "=== $cname Dashboard for $uname ==="
  echo "1. View All Problems"
  echo "2. View A Problem"
  echo "3. Submit Solution"
  echo "4. View Scorecard"
  echo "5. Home "
  read -p "Select an option (1-5): " choice

  case "$choice" in
    1)
      echo "--- Problem List ---"
      for pid in $problem_ids; do
        grep "^$pid," "$PROBLEMS_FILE" | awk -F',' '{printf "%s - %s\n", $1, $2}'
      done
      ;;
    2)
        read -p "Enter Problem ID (e.g., P001): " pid
        if [[ ! -f "../problems/$pid/statement.txt" ]]; then
         echo "❌ Problem not found."
         continue
        fi

         echo "📖 Problem Statement:"
         echo "------------------------------"
         cat "../problems/$pid/statement.txt"
         echo "------------------------------"
        ;;

    3)    
      bash practice_submission.sh "$uname" "$cname"
      ;;
    4)
      if [[ -f "$SCORECARD_FILE" ]]; then
        echo "--- Scorecard for $cname ---"
        column -t -s',' "$SCORECARD_FILE"
      else
        echo "⚠️  Scorecard not found for this contest."
      fi
      ;;
      
    5)
      echo "Exiting dashboard."
      break
      ;;
    *)
      echo "❌ Enter Valid Option."
      ;;
  esac
done
