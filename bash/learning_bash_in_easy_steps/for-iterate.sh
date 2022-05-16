#!/bin/bash
clear
echo -e "Iterating For\n"
echo -e "-----------------------------"
echo -e "\nExample:\n"
echo -e "for item in list\ndo\n  statements to execute\ndone\n"
echo -e "-----------------------------\n"

echo -e "Example:\n"

echo -e "for (( initializer ; conditional test ; incrementer ))\ndo\n  statements to execute\ndone\n"

echo -e "-----------------------------\n"

echo -e "Let's practice what we've learned. Hit enter when you are ready.\n"
read

for i in {A..Z}
do
  echo $i
done

echo -e "\n-----------------------------"

arr=(Alpha Bravo Charlie)
for i in ${!arr[@]}
do
  echo -e "\nElement $i: ${arr[$i]}"
done

echo -e "\n-----------------------------\n"

for i in Zoe Sussie Mary
do
  echo $i
done

echo -e "\n-----------------------------\n"

for i in $(ls ~/)
do
echo -e "I found in ~/: $i"
done

echo -e "\n-----------------------------\n"

for (( i=1 ; i < 3; i++ ))
do
  echo "Outer Loop Interation: $i"
  # Inner Loop To Be Added Here.
done

echo -e "\n-----------------------------\n"

for (( i=1 ; i < 3; i++ ))
do
  echo "Outer Loop Interation: $i"
  for (( j=1 ; j < 3; j++ ))
  do echo -e "\tInner Loop Iteration: $j"
  done
done
