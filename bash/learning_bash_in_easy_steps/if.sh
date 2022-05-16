#!/bin/bash
clear
echo -e "Examining Conditions\n"

echo -e "With the 'if [[ ]]' test conditional operator.\nWhen the test succeds the exit status is zero, but any other value indicates an error."
echo -e "--------------------------------------------------------------------------------------\n"
echo -e "Example:\n\nif [[ conditional test ]]\nthen\n\tstatement to execute upon success\nfi\n"

echo -e "--------------------------------------------------------------------------------------\n"

echo -e "String comparison within conditional test are mades using the operators listed below:\n"
echo " ______________________________ "
echo "| Operator | String Comparison |"
echo " ______________________________ "
echo "|    =     |       Same        |"
echo "|    !=    |      Differs      |"
echo "|    >     |     Is Greater    |"
echo "|    <     |      Is Less      |"
echo -e " ______________________________ \n"

echo -e "Integer comparison within conditional test are mades using the operators listed below:\n"
echo " ____________________________________ "
echo "|  Operator  |  Integer Comparison   |"
echo " ____________________________________ "
echo "|    -eq     |       Equality        |"
echo "|    -ne     |      Inequality       |"
echo "|    -gt     |     Greater Than      |"
echo "|    -lt     |      Less Than        |"
echo "|    -ge     | Greater Than or Equal |"
echo "|    -le     |   Less Than or Equal  |"
echo -e " ____________________________________ \n"

echo -e "--------------------------------------------------------------------------------------\n"

echo -e "\nLet's do some exercises:\n"

str=''
echo -n 'Enter your name: '
read str

if [[ $str != '' ]]
then
  echo "Hello $str"
fi

num=0
echo -n 'How much would you like to donate for this project (enter an integer): '
read num

if [[ $num -ne 0 ]]
then
  echo "Received \$$num"
fi

if [[ $str != '' && $num -ne 0 ]]
then
  echo "Thanks for your \$$num donation, $str."
fi