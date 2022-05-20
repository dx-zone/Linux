#!/bin/bash
clear

echo -e "Until Loop\n"
echo -e "The until loop statements basically works like this: 'until false, keep doing xyz'\n"
echo "To break out of the loop, the condition needs to evaluate to true at some point."
echo -e "The 'break' command can also be used to break out of the loop prematurely.\n"

echo -e "-----------------------------\n"

echo -e "initializer\nuntil conditional test becomes true\ndo\n  statement to execute\n  incrementer\ndone\n"

# initializer
# until conditional test becomes true
# do
#   statement to execute
#   incrementer
# done

echo -e "-----------------------------\n\nExample of an infinite loop: \n"
# Example of an infinite loop: until (( 0 )); do echo "Te lo dije"; done
# Example of an infinite loop: until (( false = 0 )); do echo "Te lo dije"; done
echo -e "until (( 0 )); do echo \"Can't stop this\"; done\n"
echo -e "until (( false = 0 )); do echo \"Can't stop this\"; done\n"

echo -e "-----------------------------\n\nExample:\n"

arr=(Alpha Bravo Charlie)
i=0
until (( i == ${#arr[@]} ))
do
  echo ${arr[$i]}
  ((i++))
done

echo -e "\n-----------------------------\n\nExample:\n"

i=1
until (( i > 2 ))
do
  echo "Outer Loop Iteration: $i"
  # Inner Loop To Be Addedd Here.
  (( i++ ))
done

echo -e "\n-----------------------------\n\nExample:\n"

i=1
until (( i > 2 ))
do
  echo "Outer Loop Iteration: $i"
  (( i++ ))
  until (( j > 2 ))
  do
    echo "Inner Loop Iteration: $j"
    (( j++ ))
  done
done

echo ""