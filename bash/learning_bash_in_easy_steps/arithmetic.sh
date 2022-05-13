#!/bin/bash
# File: arithmetic.sh
# Description: How to do arithmetic with the arithmetic expression/operator (())
# Example when doing arithmetic on a terminal: a=8 b=4 result=0 ; result=$((a*b)) ; echo $result

echo "********************"
echo "Arithmetic expression operators"
echo ""
echo "((result=a+b)) | Add a + b"
echo "((result=a-b)) | Substract a - b"
echo "((result=a*b)) | Multiply a * b"
echo "((result=a/b)) | Divide a / b"
echo "((result=a%b)) | Divide and return the remainder"
echo "((result=a++)) | Increment after resolving variable a"
echo "((result=++a)) | Increment variable a immediately"
echo "((result=b--)) | Decrement after resolving variable b"
echo "((result=--b)) | Increment variable b immediately"

echo ""

echo 'Example when doing arithmetic on a terminal: a=8 b=4 result=0 ; result=$((a*b)) ; echo $result'

echo ""

echo "********************"
echo "Operator | Operation"
echo "   +     | Addition"
echo "   -     | Substraction"
echo "   *     | Multiplication"
echo "   /     | Division"
echo "   %     | Modulus (remainder)"
echo "   ++    | Increment"
echo "   --    | Decrement"
echo "********************"

echo ""

a=8 b=4 result=0
echo "Assigned: a=$a b=$b"

((result=a+b))
echo "Added a+b = $result"


((result=a-b))
echo "Substracted a-b = $result"

((result=a/b))
echo "Divided a/b = $result"

((result=a*b))
echo "Multiplied a*b = $result"

((result=a%b))
echo "Modulated/Remainder a%b = $result"

echo "Current a = $((result=a++)) | Remember, the a++ increment will take effect after resolving the value of the variable a, which is 8 in this case"
echo "Incremented a = $a | This lines follows the previous expression '((result=a++))' where a++ has been incremented"

echo "Incremented b = $((result=++b)) | This line is to demonstrate the ++b increments happens immediately"

echo ""
