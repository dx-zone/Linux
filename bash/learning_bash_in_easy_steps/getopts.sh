#!/bin/bash
clear

echo -e "Recognize user options supplied to a script by using the 'getops' command.\n\nThis This takes two arguments specifying a string and a variable.\nThe 'getopts' string can accept letters and the colon character.\nEach letter is a valid option, which is followed by a colon requires an argument.\nThe option letter then get stored in the variable (without the - hyphen prefix) and its argument, if applicable, gets stored in \$OPTARG:\n\n"

echo -e "Lets do some practice. Execute the script like this: ./getops -a or ./getops -b or ./getops -c"

function process_options
{
  case $option in 
    a ) echo "Selected $option" ;;
    b ) echo "Selected $option with argument: $OPTARG" ;;
    c ) echo "Selected $option" ;;
    * ) echo 'Usage: getopts [-a] [-b arg] [-c]'
  esac
}

while getopts "ab:c" option
do 
  process_options
done
