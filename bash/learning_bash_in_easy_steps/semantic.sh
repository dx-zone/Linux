#!/bin/bash
clear

echo -e "This is an example of a semantic error. Run this script with the -v. I.E.: bash -v semantic.sh\n"

num=3

echo -e "$num x 8 + 4 = $(( num * (8 + 4)  ))\n"

echo "Is it really $(( num * (8 + 4)  ))?"
