#!/bin/bash

# Step 1: Login as admin and verify dashboard
echo "=== Testing Admin Login ==="
printf "1\nnewadmin\nadmin123\n" | bash scripts/login.sh

# Step 2: Login as setter and verify dashboard
echo "\n=== Testing Setter Login ==="
printf "1\nnewsetter\npassword\n" | bash scripts/login.sh

# Step 3: Login as contestant and verify dashboard
echo "\n=== Testing Contestant Login ==="
printf "1\ndemo\ndemo\n" | bash scripts/login.sh

# Step 4: Test solution submission
echo "\n=== Testing Solution Submission ==="
printf "DemoContest\nP001\ndemo\nsubmissions/DemoContest/demo_P001.cpp\n" | bash scripts/submit_solution.sh

# Step 5: Test judging
echo "\n=== Testing Solution Judging ==="
bash scripts/judge.sh submissions/DemoContest/demo_P001.cpp P001 demo
