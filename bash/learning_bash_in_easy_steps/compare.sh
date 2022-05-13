#!/bin/bash
clear
echo -e "Comparing Values\n"
echo -e "The relational operatos will compare values and return 1 for true or 0 for false.\n"

echo ' _________________________________________'
echo '| Operator |  Comparative Test            |'
echo ' _________________________________________'
echo '|    ==    |   Equality Test              |'
echo '|    !=    |   Innequality (Not Equal)    |'
echo '|    >     |   Greater Than Test          |'
echo '|    <     |   Less  Than                 |'
echo '|    >=    |   Greater Than or Equal Test |'
echo '|    <=    |   Less Than or Equal         |'
echo ' _________________________________________'

echo -e "Let's do some exercises:\n"


a=8 b=4 c='A' d='a'
echo -e "Equality\t ( $a == $a ): $(( a==a ))"
echo -e "Equality\t ( $a == $b ): $((a==b))"
echo -e "Equality\t ( $c == $c ): $((c == c))"
echo -e "Equality\t ( $c == $d ): $((c == d))"
echo -e "Inequality\t ( $a != $b ): $((a != b))"
echo -e "Inequality\t ( $c != $d ): $((c != d))"

echo -e "Greater Than\t ( $a > $b ): $(( a > b))"
echo -e "Less Than\t ( $a < $b ): $(( a < b))"

echo -e "Greater Than or Equal\t ( $a >= $b ): $(( a >= b ))"
echo -e "Greater Than or Equal\t ( $a >= $a 0: $(( a >= a ))"

echo -e "Less Than or Equal\t ( $a <= $b ): $(( a <= b ))"
echo -e "Less Than or Equal\t ( $a <= $a 0: $(( a <= a ))"
