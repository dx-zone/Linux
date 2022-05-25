#!/bin/bash
echo -e "Input from the command lined can be specified as arguments to the script and assigned to variables using positional parameter ($1, $2, $3, ...)\n"
echo -e "This function (add) will add two numbers.\nExample: ./add.sh 15 20\n"
# By the way, BASH does not support floating point arithmetic
# You need to use an external utility like bc
# Example:
## floating-point values
# d1=0.003
# d2=0.0008
# bc parses its input to perform math
# d1d2=$(echo "$d1 + $d2" | bc)

a=$1
b=$2

function add
{
  if [[ $a != [0-9]* ]]
  then
    echo "$a is not a positive integer"
  elif [[ $b != [0-9]* ]]
  then
    echo "$b is not a positive integer"
  else
    echo "$a + $b = $(( a + b ))"
  fi
}

if (( $# == 2 ))
  then add
else
  echo "Nothing to add. Pass two integer next time. Example: ./add 15 20"
fi
