#!/bin/bash
cd "$(dirname "$0")/.." || exit

echo "==== Admin Panel ===="
echo "1. Set contest time"
echo "2. Add problem"
echo "3. Exit"
read -p "Choose option: " opt

if [[ "$opt" == "1" ]]; then
  read -p "Enter contest start time (YYYY-MM-DD HH:MM): " start
  read -p "Enter contest end time (YYYY-MM-DD HH:MM): " end
  echo "$start" > contest_start.txt
  echo "$end" > contest_end.txt
  echo "Contest time set."
elif [[ "$opt" == "2" ]]; then
  read -p "Enter new problem ID (e.g., P002): " pid
  mkdir -p "problems/$pid" "testcases/$pid"
  touch "problems/$pid/statement.txt" "testcases/$pid/input1.txt" "testcases/$pid/output1.txt"
  echo "$pid" >> problems.txt
  echo "Problem $pid created."
else
  echo "Exiting."
fi
