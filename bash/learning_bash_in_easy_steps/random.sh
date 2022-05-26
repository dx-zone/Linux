#!/bin/bash
clear

echo -e "Randomizing numbers with RANDOM.\nRANDOM generate a pseudo-random numbers in the range 0-32767.\nAn upper limit can be set with the % arithmetic operator to specify a boundary.\nI.E.: (RANDOM % 10) to set a range between 1-10.\n"

num=$(( (RANDOM % 10) + 1 ))

function assess
{
  if (( guess == num ))
  then
    echo ":) $guess Is Correct!"
    exit
  elif (( guess < num ))
  then echo ":( $guess Is wrong - Try Higher"
  else echo ":( $guess Is Wrong - Try Lower"
  fi
}

while read -p 'Guess My Number 1-10:' guess
do
  assess
done
