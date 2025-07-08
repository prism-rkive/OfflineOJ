#!/bin/bash
cd "$(dirname "$0")/.." || exit

echo "📝 Add New Problem"

# Step 1: Enter Problem ID
read -p "Problem ID (e.g., P001): " pid
if grep -q "^$pid," problems.txt; then
  echo "❌ Problem ID already exists."
  exit 1
fi

# Step 2: Enter Metadata
read -p "Problem Title: " title
read -p "Difficulty (Easy/Medium/Hard): " difficulty

# Step 3: Add Problem Statement
mkdir -p "problems/$pid"
echo "✍️ Write the full problem statement (end with Ctrl+D):"
cat > "problems/$pid/statement.txt"

# Step 4: Add Sample Input
mkdir -p "testcases/$pid"
echo "🧪 Enter sample input (end with Ctrl+D):"
cat > "testcases/$pid/input.txt"

# Step 5: Add Expected Output
echo "🎯 Enter expected output (end with Ctrl+D):"
cat > "testcases/$pid/output.txt"

# Step 6: Save metadata
echo "$pid,$title,$difficulty" >> problems.txt

echo "✅ Problem '$title' added successfully!"


