#!/bin/bash
clear

echo -e "Testing cases with the 'case' statement\n"
echo -e "Something to keep in mind is the case match against the patterns are sequential.\nSo the order of the patterns to be matched does matter."
echo -e "-----------------------------------------------------------\n\nExample:\n"
echo -e "case test-variable in\n  pattern-1 ) statements to execute upon this success ;;\n  pattern-2 ) statements to execute upon this success ;;\n  pattern-3 ) statements to execute upon this success ;;\n* ) statements to execute upon all failure ;;\nesac\n"
echo -e "-----------------------------------------------------------"

echo -e "Let's do some practice:\n"

echo -n 'Enter Month 1-12; '
read month

case $month in
3 | 4 | 5 ) echo 'Spring!' ;;
6 | 7 | 8 ) echo 'Summer!' ;;
9 | 10 | 11 ) echo 'Autumn!' ;;
12 | 1 | 2 ) echo 'Winter!' ;;
69 ) echo "That's a sex position, not a month!" ;;
* ) echo 'Unrecognized Month' ;;
100 ) echo 'This line will never be executed as the wildcard (*) in the previous line is catching any match after all the other previous pattern matching cases' ;;
esac
