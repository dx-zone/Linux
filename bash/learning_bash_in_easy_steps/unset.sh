#!/usr/bin/env bash

# Array evaluation ${}
# Array named arr
# Index arr[1]
# @ index operator
# # lenght operator
# ! value operator
arr=(Alpha Bravo Charlie Delta Echo)
unset arr[1]
echo "Array arr[1]: ${arr[1]}"
echo "Array arr all: ${arr[@]}"
echo "Array arr lenght/size: ${#arr[@]}"
echo "Array arr elements filled: ${!arr[@]}"