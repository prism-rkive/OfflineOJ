#!/bin/bash

uname="$1" # redirect from login

while true; do
  echo "=============================="
  echo "🧑 Contestant Dashboard – $uname"
  echo "1. 📅View Contests"
  echo "2. 🧾 Participate in Contest"
  echo "3. 📚 View All Problems"
  echo "4. 📄 Read a Problem Statement"
  echo "5. 📤 Submit Solution"
  echo "6. 📤 View Submissions"
  echo "7. 🔒 Logout"
  echo "=============================="
  read -p "Choose an option: " opt

  if [[ "$opt" == "3" ]]; then
    echo "📚 Problems:"
    echo "------------------------------"
    bash scripts/unlock.sh #checking currently unlocked problems
    awk -F',' '{
      gsub(/^ +| +$/, "", $4);  # Trim leading/trailing spaces
      if (tolower($4) == "unlocked") {
        print $1 "," $2 "," $3
      }
    }' problems.txt | column -s, -t
    echo "------------------------------"
    
  elif [[ "$opt" == "4" ]]; then
    read -p "Enter Problem ID (e.g., P001): " pid
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

  elif [[ "$opt" == "5" ]]; then
    bash scripts/practice_submission.sh "$uname"  #fix location

  elif [[ "$opt" == "6" ]]; then
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

  elif [[ "$opt" == "1" ]]; then   #fix this
    echo "📅 Contest Overview"
    echo "=============================="

    current_time=$(date +%s)

    echo -e "\n🟢 Active Contests"
    echo "--------------------------------------------------------------------------------"
    printf "%-10s | %-25s | %-25s | %-20s\n" "Contest" "Start Time" "End Time" "Problems"
    echo "--------------------------------------------------------------------------------"
    while IFS='|' read -r cname start end problems; do
      if [[ "$current_time" -ge "$start" && "$current_time" -le "$end" ]]; then
        printf "%-10s | %-25s | %-25s | %-20s\n" \
          "$cname" "$(date -d @$start)" "$(date -d @$end)" "$problems"
      fi
    done <contests.txt

    echo -e "\n⏳ Upcoming Contests"
    echo "--------------------------------------------------------------------------------"
    printf "%-10s | %-25s | %-25s | %-20s\n" "Contest" "Start Time" "End Time" "Problems"
    echo "--------------------------------------------------------------------------------"
    while IFS='|' read -r cname start end problems; do
      if [[ "$current_time" -lt "$start" ]]; then
        printf "%-10s | %-25s | %-25s | %-20s\n" \
          "$cname" "$(date -d @$start)" "$(date -d @$end)" "$problems"
      fi
    done < contests.txt

    echo -e "\n✅ Previous Contests"
    echo "--------------------------------------------------------------------------------"
    printf "%-10s | %-25s | %-25s | %-20s\n" "Contest" "Start Time" "End Time" "Problems"
    echo "--------------------------------------------------------------------------------"
    while IFS='|' read -r cname start end problems; do
      if [[ "$current_time" -gt "$end" ]]; then
        printf "%-10s | %-25s | %-25s | %-20s\n" \
          "$cname" "$(date -d @$start)" "$(date -d @$end)" "$problems"
      fi
    done < contests.txt

  elif [[ "$opt" == "2" ]]; then  
    read -p "Enter Contest ID : " cname
    bash scripts/dashboard_contest.sh "$cname" "$uname"


  elif [[ "$opt" == "7" ]]; then
    echo "👋 Logged out."
    break

  else
    echo "❌ Invalid option. Try again."
  fi
done


