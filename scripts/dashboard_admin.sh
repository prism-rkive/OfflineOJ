#!/bin/bash

while true; do
  echo "🛠️ Admin Dashboard"
  echo "1. Add Contest"
  echo "2. View Problems" 
  echo "3. Read Problem Statement"
  echo "4. View Users"
  echo "5. Logout"
  read -p "Select an option: " opt

  case "$opt" in
    1)
      bash create_contest.sh 
      ;;
    2)

        {
            echo "Problem ID, Title, Difficulty, Status"
            awk -F',' 'tolower($4) ~ /available/' ../problems.txt
            awk -F',' 'tolower($4) !~ /available/' ../problems.txt
        } | column -s, -t
        ;;
    3) 
        read -p "📄 Enter Problem ID : " pid


        echo "🔍$pid:"
        echo "-----------------------------------"
        cat "../problems/$pid/statement.txt"
        echo "-----------------------------------"
        ;;
    4)
        echo "👥 Users:"
        {
          echo "Username, Role"
          awk -F',' '{gsub(/^ +| +$/, "", $0); print $1 "," $3}' ../users.txt
        } | column -s, -t
      
       ;;

    5)
      echo "Logging out..."
      exit
      ;;
    *)
      echo "❌ Invalid option. Please try again."
      ;;
  esac
done
