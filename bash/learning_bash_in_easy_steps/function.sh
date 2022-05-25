#!/bin/bash
clear
echo -e "There are two (2) ways to execute shell scripts, by typing './function.sh' or by typing 'source function.sh'. The difference is that 'source' execute a script like if it has been typed at the command prompt itself, while executing a script by prefixing './' will run the script in a sub shell so the defined funtions will not be in the current shell.\n" 

echo -e "Lets declare two functions, one named 'first' and a second named cube5\nThis script will call the 'first' function. You can type 'declare -F' or 'declare -f' to view the list of functions set in te shell. Look for the 'cube5' function, then execute it by typing 'cube5' in the terminal.\n"

echo -e "By the way, you can unset functions declared by typing 'unset f' and the function name.\n"

echo -e "Now, lets define and call the funcion named 'first'.\n"

function first
{
  echo 'Hello from the first function!'
}

cube5()
{
  echo "5x5x5 = $(( 5*5*5 ))"
}

first

