#!/bin/bash

while true; do
  echo "📦 Problem Setter Dashboard"
  echo "1. Add Problem"
  echo "2. View Problems"
  echo "3. Logout"
  read -p "Select an option: " opt

  if [[ "$opt" == "1" ]]; then
    bash scripts/add_problem.sh
  elif [[ "$opt" == "2" ]]; then
    echo "📄 Problems:"
    cat ~/cp_judge/problems.txt
  elif [[ "$opt" == "3" ]]; then
    echo "👋 Logging out..."
    exit
  else
    echo "❌ Invalid option."
  fi
done


