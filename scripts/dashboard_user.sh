#!/bin/bash
cd "$(dirname "$0")/.." || exit

uname="$1"

while true; do
  echo "=============================="
  echo "🧑 Contestant Dashboard – $uname"
  echo "1. 📚 View All Problems"
  echo "2. 🧾 View a Problem Statement"
  echo "3. 📤 Submit Solution"
  echo "4. 📄 View Submissions"
  echo "5. 📅 View All Contests"
  echo "6. 🔒 Logout"
  echo "=============================="
  read -p "Choose an option: " opt

  if [[ "$opt" == "1" ]]; then
    echo "📚 Available Problems:"
    echo "------------------------------"
    awk -F',' 'tolower($4) ~ /used/ { print $1","$2","$3 }' problems.txt | column -s, -t
    echo "------------------------------"
    
    echo "🎯 Active Contests:"
    echo "------------------------------"
    now=$(date +%s)
    
    # Read contests and display active ones
    while IFS=, read -r cname probs start end; do
      if (( now >= start && now <= end )); then
        echo "Contest: $cname"
        echo "Problems: $probs"
        echo "Time Left: $(( (end - now) / 60 )) minutes"
        echo "------------------------------"
      fi
    done < contests.txt

  elif [[ "$opt" == "2" ]]; then
    read -p "Enter Problem ID (e.g., P001): " pid
    if [[ ! -f "problems/$pid/statement.txt" ]]; then
      echo "❌ Problem not found."
      continue
    fi

    echo "📖 Problem Statement:"
    echo "------------------------------"
    cat "problems/$pid/statement.txt"
    echo "------------------------------"

    if [[ -f "testcases/$pid/input1.txt" && -f "testcases/$pid/output1.txt" ]]; then
      echo "🔍 Sample Input:"
      cat "testcases/$pid/input1.txt"
      echo
      echo "✅ Sample Output:"
      cat "testcases/$pid/output1.txt"
      echo
    else
      echo "ℹ️ No sample test case available."
    fi
    echo "------------------------------"

  elif [[ "$opt" == "3" ]]; then
    # Get current timestamp in seconds
    now=$(date +%s)
    active_contest=""
    while IFS=, read -r cname probs start end; do
      if (( now >= start && now <= end )); then
        active_contest="$cname"
        break
      fi
    done < contests.txt

    if [[ -z "$active_contest" ]]; then
      echo "❌ No active contest found."
      continue
    fi

    bash scripts/submit_solution.sh

  elif [[ "$opt" == "4" ]]; then
    echo "📄 Your Submissions:"
    echo "------------------------------"
    if [[ ! -d "submissions" ]]; then
      echo "ℹ️ No submissions found."
    else
      for f in submissions/*/${uname}_*; do
        if [[ -f "$f" ]]; then
          echo "$(basename "$f")"
        fi
      done
    fi
    echo "------------------------------"

  elif [[ "$opt" == "5" ]]; then
    echo "📅 All Contests:"
    echo "------------------------------"
    while IFS=, read -r cname probs start end; do
      echo "Contest: $cname"
      echo "Problems: $probs"
      echo "Start Time: $(date -d @$start)"
      echo "End Time: $(date -d @$end)"
      echo "------------------------------"
    done < contests.txt

  elif [[ "$opt" == "6" ]]; then
    echo "👋 Logged out."
    break

  else
    echo "❌ Invalid option. Try again."
  fi
done



