#!/bin/bash
clear

function bubble_sort
{
arr=$@
for (( i = 0 ; i < ${#arr[@]}-1 ; i++ ))
do
  for (( j = 0 ; j < ${#arr[@]}-1 ; j++ ))
  do
    if (( ${arr[j]} > ${arr[j+1]} ))
    then
      tmp=${arr[$J]}
      arr[j]=${arr[$j+1]}
      arr[$j+1]=$tmp
    fi
  done
done
echo "Original Order: ${nums[@]}"
echo "Sorted Order: ${arr[@]}"
}

nums=(3 8 20 25 12 7 32 1 16 29)
bubble_sort ${nums[@]}
