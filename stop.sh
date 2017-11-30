#!/bin/bash

set -e
set -o pipefail

read -p "User: " user
read -sp "Password: " password

available=(41 42 43 44 46 47 48 49 50 51 52 53 54 55 56 57 58 59 61 62 64 65 66)

for pc in "${available[@]}"
do
	./sshpass/sshpass ssh -o StrictHostKeyChecking=no -l "$user" infcip$pc "pkill -x beep" <<<"$password" &
done
wait
