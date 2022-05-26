#!/usr/bin
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
  # Local variable scope
  str='Linux'
  local int=200
  echo "Function paraeters: $1 $2"
  echo -e "Local Integer: $int\n"
}

call_me 'AI'

echo "Global String: $str"
echo "Global Integer: $int"
