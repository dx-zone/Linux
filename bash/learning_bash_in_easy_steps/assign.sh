#!/bin/bash
#
# Assigning Values
#
clear

echo -e "Assign value operators\n"
echo " __________________________________ "
echo "| Operator | Example | Equivalent  |"
echo "|    =     | a =  b  | a = b       |"
echo "|    +=    | a += b  | a = (a + b) |"
echo "|    -=    | a -= b  | a = (a - b) |"
echo "|    *=    | a *= b  | a = (a * b) |"
echo "|    /=    | a /= b  | a = (a / b) |"
echo "|    %=    | a %= b  | a = (a % b) |"
echo " __________________________________ "
echo ""

echo -e "This basically works by doing the arithmetic operation first between variable 'a' and variable 'b' and then store the result in the first variable 'a'.\n"

echo -e "Let's do some excercises:\n"

a=8 b=4
echo -e "Assigned: a=$a b= $b \n"

(( a += b ))
echo -e "Added and assigned:\t\t a+=b (8+=4) a=$a"

(( a -= b ))
echo -e "Substracted and assigned:\t a-=b (12-=4) a=$a"

(( a *= b ))
echo -e "Multiplied & assigned: \t\t a*=b (8*=4) a=$a"

(( a /= b ))
echo -e "Divided and assigned:\t\t a/=b (32/=4) a=$a"

(( a %= b ))
echo -e "Modulated and assigned:\t\t a%=b (8%=4) a=$a\n"