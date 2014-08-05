#!/bin/bash
limit=$1
echo
echo "Timing $limit minutes..."
echo
counter=0
while [ $counter != $limit ]; do
   echo "$counter minutes so far...";
   sleep 60
   let "counter = $counter + 1"
done
if [ $counter = $limit ]; then
   echo
   echo "Time's up - $counter minutes have elapsed!"

   counter=0
   while [ $counter != 10 ]; do
   	mpg123 ~/beep.mp3
	let "counter = $counter + 1"
   done

   exit 0
fi
