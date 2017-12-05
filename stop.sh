#!/bin/bash

set -e
set -o pipefail

read -p "User: " user
read -sp "Password: " password

available524=(41 42 43 44 46 47 48 49 50 51 52 53 54 55 56 57 58 59 61 62 64 65 66)
available523=(10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40)

read -p "Room number: " room

if [ "$room" -ne 524 ] && [ "$room" -ne 523 ] ; then
	echo "Wrong room number"
	exit
fi

eval "available=(\${available${room}[@]})"


for pc in "${available[@]}"
do
	./sshpass/sshpass ssh -o StrictHostKeyChecking=no -l "$user" infcip$pc "pkill -x beep" <<<"$password" &
done
wait
