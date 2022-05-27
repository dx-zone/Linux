#!/bin/bash
# alias cutter='read -p "Enter a filename. Example: my_script.sh: " x; touch $x; chmod +111 $x; git add $x; git commit -am "adding $x"; vi $x'

# Save arguments passed in the variable x 
x=$@

# Check if argument has been pass to create an alias, otherwise prompt the user 
if [[ $# == 0 ]]
then
  echo "Type a filename. For example: ./cutter my_filename"
else
  echo "Filename typed: $@"
  touch $x ; chmod +111 $x ; git add $x ; git commit -am "adding $x" ; vi $x
fi
