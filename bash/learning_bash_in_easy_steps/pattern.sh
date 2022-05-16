#!/bin/bash
clear
echo -e "Matching Patterns"

echo ' __________________________________________________________________________________________________'
echo '|    ${var#pattern}      | Seek pattern at the start of var then remove the shortest matching part |'
echo ' __________________________________________________________________________________________________'
echo ' __________________________________________________________________________________________________'
echo '|    ${var##pattern}     | Seek pattern at the start of var then remove the longest matching part  |'
echo ' __________________________________________________________________________________________________'
echo ' __________________________________________________________________________________________________'
echo '|    ${var%pattern}      | Seek pattern at the end of var then remove the shortest matching part   |'
echo ' __________________________________________________________________________________________________'
echo ' __________________________________________________________________________________________________'
echo '|    ${var%%pattern}     | Seek pattern at the end of var then remove the longest matching part    |'
echo ' __________________________________________________________________________________________________'
echo ' __________________________________________________________________________________________________'
echo '| ${var/pattern/string}  | Seek the first instance of pattern in var then replace it with string   |'
echo ' __________________________________________________________________________________________________'
echo ' __________________________________________________________________________________________________'
echo '| ${var//pattern/string} | Seek all instances of pattern in var then replace each with string      |'
echo ' __________________________________________________________________________________________________'

echo -e "\n\nLet's do some excercises:\n"

video='/media/mp4/matrix.reloaded.mp4'
var=$video

echo " ___________________________________ "
echo '| var='/media/mp4/matrix.reloaded.mp4' |'
echo " ___________________________________ "
echo ""

echo '${var/matrix.}'
echo -e "${var/matrix.}"
echo ""

echo '${var#/*/}'
echo ${var#/*/}
echo ""

echo '${var##/*/}'
echo ${var##/*/}
echo ""

echo '${var%.*}'
echo ${var%.*}
echo ""

echo '${var%%.*}'
echo ${var%%.*}
echo ""

echo '${var/mp4/vid}'
echo ${var/mp4/vid}
echo ""

echo '${var/%mp4/vid}'
echo ${var/%mp4/vid}
echo ""

echo '${var//mp4/vid}'
echo ${var//mp4/vid}
echo ""
