#!/bin/bash
#Player
#
# This runs the beep script on the client pc
#
# takes a target date as first argument
# and the script to run as second argument

cd Dokumente/beeper/tracks
#echo "$1"
#echo $(($1 - $(date +%s%N)))

while [ $(($1 - $(date +%s%N))) -gt 0 ]; do
echo $(($1 - $(date +%s%N)))
:
done

#beep -l 1000
. $2
exit
