#!/bin/bash

read -p "User: " user
read -sp "Password: " password

available=(41 42 43 44 46 47 48 49 50 51 52 53 54 55 56 57 58 59 61 62 64 65 66)
#~ 
#~ for i in {41..66}
#~ do
	#~ ping -c 2 infcip$i
	#~ if [ $? -ne 1 ]; then
		#~ available+=($i)
	#~ fi
#~ done

#~ echo ${available[*]}

cd tracks

counter=0
target=$(($(date +%s%N) + 5000000000))

for f in *
do
	../sshpass/sshpass ssh -o StrictHostKeyChecking=no -l $user infcip${available[counter]} "./Dokumente/beeper/do_beep.sh $target" <<<"$password" $f &
	counter=$((counter+1))
done
wait
