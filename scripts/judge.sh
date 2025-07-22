#!/bin/bash
# Usage: judge.sh <solution_file> <problem_id> <username>
solution="$1"
pid="$2"
uname="$3"
cname="$4"

if [[ -z "$solution" || -z "$pid" || -z "$uname" ]]; then
  echo "Usage: judge.sh <solution_file> <problem_id> <username>"
  exit 1
fi

# Default time limit in seconds (can be overridden per-problem later)
DEFAULT_TIME_LIMIT=2

# ── create isolated workspace ─────────────────────────────────────────────
workdir=$(mktemp -d)
trap 'rm -rf "$workdir"' EXIT
exec_path="$workdir/a.out"

# ── 1. COMPILE ────────────────────────────────────────────────────────────
g++ "$solution" -O2 -std=c++17 -o "$exec_path" 2> "$workdir/compile_err.txt"
if [[ $? -ne 0 ]]; then
  echo "CE (Compilation Error)"
  cat "$workdir/compile_err.txt"
  verdict="CE"
else
  # ── 2. RUN ON ALL TEST CASES ────────────────────────────────────────────
  pass=0
  total=0
  for in_file in testcases/"$pid"/input*.txt; do
    [[ -e "$in_file" ]] || continue            # skip if no input files
    ((total++))
    num=${in_file##*input}
    num=${num%%.txt}
    out_file="testcases/$pid/output${num}.txt"
    if [[ ! -f "$out_file" ]]; then
      echo "⚠️  Missing expected output file $out_file – skipping"
      continue
    fi

    timeout $DEFAULT_TIME_LIMIT "$exec_path" < "$in_file" > "$workdir/user_out.txt"
    rc=$?
    if [[ $rc -eq 124 ]]; then
      echo "❌ Test $num: TLE"
    elif diff -q "$workdir/user_out.txt" "$out_file" >/dev/null; then
      echo "✅ Test $num: Passed"
      ((pass++))
    else
      echo "❌ Test $num: WA"
    fi
  done

  if (( total == 0 )); then
    echo "⚠️  No test cases found for problem $pid"
    verdict="IE"      # Internal Error
  elif (( pass == total )); then
    verdict="AC"
  else
    verdict="WA"
  fi
fi

# ── 3. LOG VERDICT ────────────────────────────────────────────────────────
timestamp=$(date +"%Y-%m-%d %H:%M:%S")
echo "$uname,$pid,$verdict,$timestamp" >> submission.txt

echo "Final verdict: $verdict ($pass / $total)"
bash scripts/scoreboard.sh "$cname" "$uname" "$verdict" "$timestamp" "$pid" 

