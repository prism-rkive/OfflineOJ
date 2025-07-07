#!/bin/bash
cd "$(dirname "$0")/.." || exit

echo "📋 CP Judge - New User Registration"
read -p "Choose a username: " uname

# Check if username already exists
if grep -q "^$uname," users.txt; then
    echo "❌ Username already taken. Try another."
    exit 1
fi

read -s -p "Choose a password: " pass
echo
read -s -p "Confirm password: " pass2
echo

if [ "$pass" != "$pass2" ]; then
    echo "❌ Passwords do not match."
    exit 1
fi

# Hash password
hash=$(echo -n "$pass" | md5sum | awk '{print $1}')

# Save as contestant
echo "$uname,$hash,contestant" >> users.txt
echo "✅ User registered successfully! You can now log in."

