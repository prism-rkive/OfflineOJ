#!/bin/bash
cd "$(dirname "$0")/.." || exit

uname="$1"

while true; do
  echo "=============================="
  echo "🧑 Contestant Dashboard – $uname"
  echo "1. 📚 View All Problems"
  echo "2. 🧾 View a Problem Statement"
  echo "3. 📤 Submit Solution"
  echo "4. 📄 View Submissions"
  echo "5. 🔒 Logout"
  echo "=============================="
  read -p "Choose an option: " opt

  if [[ "$opt" == "1" ]]; then
    echo "📚 Available Problems:"
    echo "------------------------------"
    column -s, -t problems.txt
    echo "------------------------------"

  elif [[ "$opt" == "2" ]]; then
    read -p "Enter Problem ID (e.g., P001): " pid
    if [[ ! -f "problems/$pid/statement.txt" ]]; then
      echo "❌ Problem not found."
      continue
    fi

    echo "📖 Problem Statement:"
    echo "------------------------------"
    cat "problems/$pid/statement.txt"
    echo "------------------------------"

    if [[ -f "testcases/$pid/input1.txt" && -f "testcases/$pid/output1.txt" ]]; then
      echo "🔍 Sample Input:"
      cat "testcases/$pid/input1.txt"
      echo
      echo "✅ Sample Output:"
      cat "testcases/$pid/output1.txt"
      echo
    else
      echo "ℹ️ No sample test case available."
    fi
    echo "------------------------------"

  elif [[ "$opt" == "3" ]]; then
    read -p "Enter Problem ID to submit (e.g., P001): " pid
    if ! grep -q "^$pid," problems.txt; then
      echo "❌ Invalid problem ID"
      continue
    fi

    read -p "Path to your .cpp file: " filepath
    if [[ ! -f "$filepath" ]]; then
      echo "❌ File not found."
      continue
    fi

    cp "$filepath" "solutions/${uname}_${pid}.cpp"
    echo "✅ Code submitted as: solutions/${uname}_${pid}.cpp"

    # Instant verdict here
    bash scripts/judge.sh "${uname}_${pid}.cpp" "$pid"

  elif [[ "$opt" == "4" ]]; then
    echo "📄 Your Submissions:"
    if grep -q "^$uname," submission.txt 2>/dev/null; then
      grep "^$uname," submission.txt | column -s, -t
    else
      echo "ℹ️ No submissions found."
    fi

  elif [[ "$opt" == "5" ]]; then
    echo "👋 Logged out."
    break

  else
    echo "❌ Invalid option. Try again."
  fi
done



