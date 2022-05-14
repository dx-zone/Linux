#!/bin/bash
clear

echo -e "\tAssesing Logic\n"

tru=1 fal=0

echo " ____________________________ "
echo "|   Operator  |  Operation   |"
echo "| __________________________ |"
echo "|     &&      |  Logical AND |"
echo "|     ||      |  Logical OR  |"
echo "|     !       |  Logical NOT |"
echo "| __________________________ |"

echo -e "\nLets do some exercises:\n"

echo "1 is true"
echo -e "0 is false\n"

# The logical operators needs to be enclosed between $((  )) for evaluation
# Example: $(( 1 || 0 ))

echo -e "AND\t ( $fal && $fal ): $(( fal && fal ))"

echo -e "AND\t ( $tru && $fal ): $(( tru && fal ))"

echo -e "AND\t ( $tru && $tru ): $(( tru && tru ))"

echo -e "OR\t ( $fal || $fal ): $(( fal || fal))"

echo -e "OR\t ( $tru || $fal ): $(( tru || fal ))"

echo -e "OR\t ( $tru || $fal ): $(( tru || fal ))"

result=$(( 0 || 1 ))
echo -e '\nExpression: result=$(( 0 || 1 ))'
echo -e "The result for the expression evaluates to: $result\n"