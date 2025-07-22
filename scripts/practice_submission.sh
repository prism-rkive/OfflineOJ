echo "=== Submit Solution ==="
read -p "Problem ID: " pname
uname=$1
cname=$2
if [[ -z "$cname" ]]; then
  cname="practice"
fi
read -p "Solution file path: " spath


# Save submission
mkdir -p "../submissions/$cname" #PATH
ext="${spath##*.}"
dest_path="../submissions/$cname/${uname}_${pname}.${ext}" #pATH

cp "$spath" "$dest_path"

echo "✅ Submitted "
echo "Judging..."
bash judge.sh "$dest_path" "$pname" "$uname" "$cname" #loc
