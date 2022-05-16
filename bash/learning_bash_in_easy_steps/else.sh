#!/bin/bash
clear
echo -e "Examining Multiple Conditional Test with 'if', 'elif' and 'else' Statement\n"

echo -e "With the 'if [[ ]]' test conditional operator.\nWhen the test succeds the exit status is zero (0), but any other value indicates an error.\nThe 'else' or 'elif' statement will then execute when the exit status indicates failure (1)."
echo -e "--------------------------------------------------------------------------------------\n"

echo -e "Example of a conditional test with failure ('else' statement):\n"
echo -e "if [[ conditional test ]]\nthen\n  statements to execute upon success\nelse\n  statements to execute upon failure\n"
echo -e "--------------------------------------------------------------------------------------\n"

echo -e "Example of a multiple conditional test ('elif' statement):\n"
echo -e "if [[ conditional test ]]\nthen\n  statement to execute upon this success\nelif [[ conditional test ]]\nthen\n  statement to execute upon this success\nfi\n"
echo -e "--------------------------------------------------------------------------------------\n"

echo -e "Example of a conditional test with multiple failures ('elif' and 'else' statements):\n"
echo -e "if [[ conditional test ]]\nthen\n  statement to execute upon this success\nelif [[ conditional test ]]\nthen\n  statement to execute upon this success\nelif [[ conditional test ]]\nthen\n  statement to execute upon this success\nelse\n  statement to execute upon all failures\nfi\n"

echo -e "--------------------------------------------------------------------------------------\n"

echo -e "\nNow let's do some exercises:\n"

echo -n 'Enter hours 0-12: '
read hrs

if [[ $hrs = "" || $hrs -gt 23 ]]
  then echo 'Ivalid Hours!'
elif [[ $hrs -ge 0 && $hrs -lt 12 ]]
  then echo 'Good Morning!'
elif [[ $hrs -ge 12 && $hrs -lt 18 ]]
  then echo 'Good Afternoon!'
else echo 'Good Evening!'
fi

