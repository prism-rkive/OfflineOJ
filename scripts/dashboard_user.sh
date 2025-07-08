#!/bin/bash
echo "🧑 Contestant Dashboard"
echo "1. View Contests"
echo "2. Submit Code"
echo "3. View Submissions"
echo "4. Logout"
read -p "Enter problem ID: " pid
cat "problems/$pid/statement.txt"

