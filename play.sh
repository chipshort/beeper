#!/bin/bash

set -e
set -o pipefail

if [ -z "$1" ]; then
	echo "Usage: play.sh DIRECTORY_WITH_TRACK_SCRIPTS"
	exit
fi

curpath="$(dirname $(readlink -f '$0'))"

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

#~ 
#~ for i in {41..66}
#~ do
	#~ ping -c 2 infcip$i
	#~ if [ $? -ne 1 ]; then
		#~ available+=($i)
	#~ fi
#~ done

#~ echo ${available[*]}

cd "$1"

counter=0
target=$(($(date +%s%N) + 5000000000))


for f in *
do
	"$curpath/sshpass/sshpass" ssh -o StrictHostKeyChecking=no -l "$user" infcip${available[counter]} "$curpath/do_beep.sh $target" <<<"$password" "$(readlink -f "$f")" &
	counter=$((counter+1))
done
wait
