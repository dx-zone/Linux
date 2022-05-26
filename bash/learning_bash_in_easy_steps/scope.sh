#!/bin/bash
clear

# Global variable scope
str='Windows'
int=100

# Parameter scope variables
echo "Script parameters: $1 $2"

# Global variable scope
echo "Global String: $str"
echo -e "Global Integer: $int\n"

function call_me
{
  # The 'str' variable will be accesible from the global scope
  str='This is a string define inside a function'
  # Local variable scope
  local int=200
  echo "Function parameters: $1 $2"
  echo -e "Local Integer: $int\n"
}

#call_me 'Hey', 'you!'
call_me 'AI' # we are passing only one parameter but the function can also accept two.

# Global variable scope
echo "Global String: $str" # This will display the variable 'str' inside the function
echo "Global Integer: $int"
