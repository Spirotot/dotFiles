#!/bin/bash
workouts[0]="Scissor Twist (https://www.youtube.com/watch?v=Tg0O8KvvjtE )"
workouts[1]="Row Your Boat (https://www.youtube.com/watch?v=q3F2Bao2Xnk)"
workouts[2]="Banana X (http://www.buildahardbody.com/p90x2-ab-ripper/ )"
workouts[3]="Oblique roll (http://www.buildahardbody.com/p90x2-ab-ripper/ )"
workouts[4]="Roll V Hold (https://www.youtube.com/watch?v=ZyLTL4oSJgU )"
workouts[5]="Abrinome (http://www.buildahardbody.com/p90x2-ab-ripper/ )"
workouts[6]="Gate Bridge Lifts (https://www.youtube.com/watch?v=GE_9BlowWBc )"
workouts[7]="Phelan Twist (http://www.buildahardbody.com/p90x2-ab-ripper/ )"
workouts[8]="Scissor Clapper (http://www.buildahardbody.com/p90x2-ab-ripper/ )"
workouts[9]="Tornado (http://www.buildahardbody.com/p90x2-ab-ripper/ )"
workouts[10]="Balance Bikes (http://www.buildahardbody.com/p90x2-ab-ripper/ )"

limit=$1
echo
echo "Timing $limit minutes..."
echo

index=0
if [ -f ~/bin/last_workout ]; then
    let "index = `cat ~/bin/last_workout` + 1"
    if [ $index = 11 ]; then
       index=0
    fi
fi

while [ 1 = 1 ]; do
    echo "Do ${workouts[$index]}."
    echo "When finished, enter new timer value, or just Enter to keep current $limit minute timer: "
    read tmplimit

    if [ "X$tmplimit" != "X" ]; then
        limit=$tmplimit
    fi

    echo $index > ~/bin/last_workout

    counter=0
    while [ $counter != $limit ]; do
       echo "$counter of $limit minutes so far...";
       sleep 60
       let "counter = $counter + 1"
    done
    if [ $counter = $limit ]; then
       echo
       echo "Time's up - $counter minutes have elapsed!"

       counter=0
       while [ $counter != 10 ]; do
        mpg123 ~/beep.mp3 > /dev/null 2>&1
        let "counter = $counter + 1"
       done
   fi

   let "index = $index + 1"
   if [ $index = 11 ]; then
       index=0
   fi
done
