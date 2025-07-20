#!/bin/bash

PRACTICE_DIR="../practice_problems"
TMP_DIR="../tmp/practice_run"
mkdir -p "$TMP_DIR"

echo "=== 🧪 Practice Mode ==="

# List problems
problems=()
i=1
echo "Available Problems:"
for dir in "$PRACTICE_DIR"/*/; do
    pname=$(basename "$dir")
    echo "  [$i] $pname"
    problems+=("$pname")
    ((i++))
done

# Read selection
read -p "Select a problem number: " choice
if ! [[ "$choice" =~ ^[0-9]+$ ]] || (( choice < 1 || choice > ${#problems[@]} )); then
    echo "❌ Invalid choice"
    exit 1
fi

selected="${problems[$((choice - 1))]}"
pdir="$PRACTICE_DIR/$selected"

echo "📘 Problem: $selected"
echo "Tags and Difficulty:"
cat "$pdir/metadata.txt"
echo ""

# Ask for code
echo "✍️  Provide your solution code in C or C++ (you'll be prompted to edit a temp file)"
TMP_CODE="$TMP_DIR/${selected}_sol.cpp"
cat <<EOF > "$TMP_CODE"
// Write your solution here. Use stdin for input and stdout for output.
#include <iostream>
using namespace std;

int main() {
    return 0;
}
EOF

nano "$TMP_CODE"

# Compile
g++ "$TMP_CODE" -o "$TMP_DIR/a.out"
if [[ $? -ne 0 ]]; then
    echo "❌ Compilation failed!"
    exit 1
fi

# Run with input and compare output
INPUT="$pdir/input.txt"
EXPECTED="$pdir/output.txt"
ACTUAL="$TMP_DIR/actual_output.txt"

"$TMP_DIR/a.out" < "$INPUT" > "$ACTUAL"

echo ""
echo "📤 Your Output:"
cat "$ACTUAL"
echo ""
echo "📥 Expected Output:"
cat "$EXPECTED"
echo ""

# Compare
if diff -q "$ACTUAL" "$EXPECTED" > /dev/null; then
    echo "✅ Output matched! 🎉"
else
    echo "❌ Output did not match."
    diff "$ACTUAL" "$EXPECTED"
fi

# Clean
rm -f "$TMP_DIR/a.out"

echo ""
echo "🔁 You can re-run this script to practice another problem."
