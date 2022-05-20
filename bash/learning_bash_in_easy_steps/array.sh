#!/usr/bin/env bash

# Array evaluation ${}
# Array named arr. I.E. arr=(Alpha Bravo Charlie Delta Echo '')
# Index arr[1]
# @ index operator
# # lenght operator
# ! value operator

echo -e "Array evaluation \${}\nArray named arr. I.E. arr=(Alpha Bravo Charlie Delta Echo '')\nIndex arr[1]\n@ index operator\n\# lenght operator\n! value operator\n"

arr=(Alpha Bravo Charlie Delta Echo '')
echo "Array arr[1]: ${arr[1]}"
echo "Array arr all: ${arr[@]}"
echo "Array arr lenght/size: ${#arr[@]}"
echo "Array arr elements filled: ${!arr[@]}"