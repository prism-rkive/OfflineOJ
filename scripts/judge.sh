#!/bin/bash
cd "$(dirname "$0")/.." || exit

read -p "🔎 Enter Problem ID (e.g., P002): " pid
read -p "📄 Enter submission filename (C++ source inside solutions/, e.g., mycode.cpp): " subfile

src="solutions/$subfile"
bin="solutions/a.out"

if [[ ! -f "$src" ]]; then
  echo "❌ Submission file not found: $src"
  exit 1
fi

# Compile
g++ "$src" -o "$bin"
if [[ $? -ne 0 ]]; then
  echo "❌ Compilation failed."
  exit 1
fi

echo "⚙️ Running test cases for $pid..."
echo "--------------------------------"

tc_path="testcases/$pid"
count=1
pass=0

while [[ -f "$tc_path/input$count.txt" && -f "$tc_path/output$count.txt" ]]; do
  ./solutions/a.out < "$tc_path/input$count.txt" > "solutions/user_output.txt"

  if diff -q "solutions/user_output.txt" "$tc_path/output$count.txt" >/dev/null; then
    echo "✅ Test case $count: Passed"
    ((pass++))
  else
    echo "❌ Test case $count: Failed"
    echo "🔎 Expected:"
    cat "$tc_path/output$count.txt"
    echo "📤 Got:"
    cat "solutions/user_output.txt"
  fi
  echo "--------------------------------"
  ((count++))
done

total=$((count - 1))
echo "🎉 Result: $pass / $total test cases passed"
rm -f solutions/user_output.txt solutions/a.out

