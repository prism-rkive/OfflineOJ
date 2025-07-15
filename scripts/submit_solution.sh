echo "=== Submit Solution ==="
read -p "Contest name: " cname
read -p "Problem name: " pname
read -p "Your username: " uname
read -p "Solution file path: " spath

# Check if contest exists
if ! grep -q "^$cname," contests.txt; then
  echo "❌ Contest not found."
  exit 1
fi

# Check contest time window
start_ts=$(grep "^$cname," contests.txt | cut -d',' -f3)
end_ts=$(grep "^$cname," contests.txt | cut -d',' -f4)
now_ts=$(date +%s)
if (( now_ts < start_ts || now_ts > end_ts )); then
  echo "❌ Submissions are not allowed at this time."
  exit 1
fi

# Check if problem is part of the contest
probs=$(grep "^$cname," contests.txt | cut -d',' -f2)
IFS=',' read -ra prob_arr <<< "$probs"
found=0
for p in "${prob_arr[@]}"; do
  if [[ "$p" == "$pname" ]]; then
    found=1
    break
  fi
done
if [[ $found -eq 0 ]]; then
  echo "❌ Problem '$pname' is not part of contest '$cname'."
  exit 1
fi

# Save submission
mkdir -p "submissions/$cname"
ext="${spath##*.}"
cp "$spath" "submissions/$cname/${uname}_${pname}.${ext}"
echo "✅ Submission saved as submissions/$cname/${uname}_${pname}.${ext}"