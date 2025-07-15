#!/bin/bash
while true; do
  echo "🛠️ Admin Dashboard"
  echo "1. Add Contest"
  echo "2. View Users"
  echo "3. Logout"
  read -p "Select an option: " opt

  if [[ "$opt" == "1" ]]; then
    bash scripts/add_contest.sh
  elif [[ "$opt" == "2" ]]; then
    cat users.txt
  elif [[ "$opt" == "3" ]]; then
    echo "Logging out..."
    exit
  else
    echo "Invalid option."
  fi
done