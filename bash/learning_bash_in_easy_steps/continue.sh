#!/bin/bash
clear
echo -e "Skipping a single iteration in the loop with the 'continue' command.\n"

for (( i = 1; i < 4; i++ ))
do
  for (( j = 1; j < 4; j++ ))
  do
    # Test for continue to be addedd here
    if (( i == 2 && j == 1 ))
    then
      echo '---Inner Loop Continued---'
      continue
    fi
    echo -e "Outer $i \tInner: $j"
  done
done
