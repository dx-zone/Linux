#!/bin/bash
clear

echo -e "Using a recursive function to call itself to execute a statemnt it contains.\n"

for (( i = 1; i < 65; i++ ))
{
  (( arr[i-1] = i ))
}

i=1 ; key=8

function linear_search
{
  echo "Element value: ${arr[$i-1]}"
  if (( arr[i-1] == key ))
  then
    echo "Linear search found $key on attempt $i"
    return 0
  else
    (( i++ ))
    linear_search
  fi
}
linear_search
