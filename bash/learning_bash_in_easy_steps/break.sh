#!/bin/bash
clear
echo -e "Breaking out of the loop prematurely with the 'break' command.\n"
for (( i = 1 ; i < 4; i++ ))
do
  for (( j = 1; j < 4; j++))
  do
    if (( i == 2 && j == 1 ))
    then
      echo '---Inner Loop Broken---'
      break
    fi
    echo -e "Outer $i\tInner: $j"
  done
done
