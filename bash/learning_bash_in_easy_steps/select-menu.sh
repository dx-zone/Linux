#!/bin/bash

clear

echo -e "Selecting Option\n"


echo -e "\n-----------------------------\n\nExample:\n"

echo -e "select item in list\ndo\n  statement to execute\ndone\n"

echo -e "-----------------------------\n\nLets practice what we've learned:\n"

select i in {A..C}
do
  echo "You have choosen: $i"
  break
done

echo -e "\n-----------------------------\n"

arr=(Alpha Bravo Charlie)
PS3='Please Choose A Number: '
select name in ${arr[@]}
do
  echo "$REPLY Choosen For $name"
  break
done
