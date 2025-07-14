#!/bin/bash
cd "$(dirname "$0")/.." || exit

echo "📝 Add New Problem"

# Enter Problem ID
read -p "Problem ID (e.g., P001): " pid
if grep -q "^$pid," problems.txt; then
  echo "❌ Problem ID already exists."
  exit 1
fi

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
echo "$pid,$title,$difficulty" >> problems.txt
echo "📚 Problem '$title' ($pid) added with $((tc - 1)) test case(s)!"

