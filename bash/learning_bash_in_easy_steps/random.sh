#!/bin/bash
clear

echo -e "Randomizing numbers.\n"

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
