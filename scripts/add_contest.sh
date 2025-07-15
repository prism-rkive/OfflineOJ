echo "=== Add Contest ==="
read -p "Contest name: " cname
read -p "Problems (comma separated, e.g. problemA,problemB): " probs
read -p "Start time (YYYY-MM-DD HH:MM): " start
read -p "End time (YYYY-MM-DD HH:MM): " end

start_ts=$(date -d "$start" +%s)
end_ts=$(date -d "$end" +%s)

if [[ -z "$cname" || -z "$probs" || -z "$start" || -z "$end" ]]; then
  echo "❌ All fields are required."
  exit 1
fi

echo "$cname,$probs,$start_ts,$end_ts" >> contests.txt
echo "✅ Contest '$cname' created successfully!"