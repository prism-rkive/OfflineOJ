#!/bin/bash
cd "$(dirname "$0")/.." || exit

echo "📘 Welcome to OfflineOJ"
echo "1. Login"
echo "2. Register"
read -p "Select an option [1-2]: " choice

if [[ "$choice" == "2" ]]; then
  bash scripts/register.sh
  exit
elif [[ "$choice" != "1" ]]; then
  echo "❌ Invalid option. Exiting."
  exit 1
fi

echo "🔐 Login"
read -p "Username: " uname
read -s -p "Password: " pass
echo

# Hash the password
hash=$(echo -n "$pass" | md5sum | awk '{print $1}')

# Check against users.txt
found=0
while IFS=',' read -r user stored_hash role; do
  if [[ "$user" == "$uname" && "$stored_hash" == "$hash" ]]; then
    echo "✅ Login successful as $role"
    found=1
    role_found="$role"
    break
  fi
done < users.txt

if [[ "$found" -eq 0 ]]; then
  echo "❌ Invalid credentials"
  exit 1
fi

# Role-based dashboard
if [[ "$role_found" == "admin" ]]; then
  bash scripts/dashboard_admin.sh
elif [[ "$role_found" == "problem_setter" ]]; then
  bash scripts/dashboard_setter.sh
else
  bash scripts/dashboard_user.sh $uname
fi


