#!/bin/bash
clear
echo -e "While Loop\n"
echo -e "The while loop statements basically works like this: 'while true, keep doing xyz'\n"
echo "To break out of the loop, the condition needs to evaluate to false at some point."
echo -e "The 'break' command can also be used to break out of the loop prematurely.\n"

echo -e "-----------------------------\n"

echo -e "initializer\nwhile conditional test is true\ndo\n  statement to execute\n  incrementer\ndone\n"

# initializer
# while conditional test is true
# do
#   statement to execute
#   incrementer
# done

echo -e "-----------------------------\n\nExample of an infinite loop: \n"
# Example of an infinite loop: while (( 1 )); do echo "Keep going!"; done
# Example of an infinite loop: while (( true = 1 )); do echo "Keep going!"; done
echo -e 'while (( 1 )); do echo "Keep going!"; done\n'

echo -e 'while (( true = 1 )); do echo "Keep going!"; done\n'

echo -e "-----------------------------\n\nExample:\n"

arr=(Alpha Bravo Charlie)
i=0
while (( i < ${#arr[@]} ))
do
  echo ${arr[$i]}
  ((i++))
done

echo -e "\n-----------------------------\n\nExample:\n"

i=1
while ((i < 3 ))
do
  echo "Outer Loop Iteration: $i"
  (( i++ ))
  # Inner Loop To Be Added Here.
done

echo -e "\n-----------------------------\n\nExample:\n"

i=1
while ((i < 3 ))
do
  echo "Outer Loop Iteration: $i"
  (( i++ ))
  j=1
  while (( j < 3 ))
  do
    echo -e "\tInner Loop Iteration: $j"
    (( j++ ))
  done
done