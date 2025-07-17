#!/bin/bash
cd "$(dirname "$0")/.." || exit

echo "📝 Add New Problem"

#Auto problem id generation
last_id=$(awk -F',' '{gsub(/^[ \t]+|[ \t]+$/, "", $1); print $1}' ../problems.txt \
  | grep -E "^P[0-9]+" | sed 's/^P//' | sort -n | tail -n 1)

# If none exist, start from 1
if [ -z "$last_id" ]; then
  new_id_num=1
else
  new_id_num=$((10#$last_id + 1))  # 10# to force base 10
fi

# Format ID: P001-P999, then P1000+
if [ "$new_id_num" -lt 1000 ]; then
  pid=$(printf "P%03d" "$new_id_num")
else
  pid="P$new_id_num"
fi

echo "Generated Problem ID: $pid"

# Diff
read -p "Problem Title: " title
read -p "Difficulty (Easy/Medium/Hard): " difficulty

# Add PSPs
mkdir -p "problems/$pid"
echo "✍️ Write the full problem statement (end with Ctrl+D):"
cat > "problems/$pid/statement.txt"

# Add testcases
mkdir -p "testcases/$pid"
echo "📥 Now add test cases for $pid"

tc=1
while true; do
  read -p "➕ Add test case #$tc? (y/n): " choice
  [[ "$choice" != "y" ]] && break

  echo "🧪 Enter input for test case #$tc (end with Ctrl+D):"
  cat > "testcases/$pid/input$tc.txt"

  echo "🎯 Enter expected output for test case #$tc (end with Ctrl+D):"
  cat > "testcases/$pid/output$tc.txt"

  echo "✅ Test case #$tc added!"
  ((tc++))
done

# prblm data save koro
echo "$pid,$title,$difficulty,Available" >> problems.txt
echo "📚 Problem '$title' ($pid) added with $((tc - 1)) test case(s)!"

