#!/bin/bash
clear

echo -e "New York lotto game simulator\n"

if [[ $1 = [0-9]* && $1 -lt 10 ]]
then a=$1 ; else a=6 ; fi

if [[ $2 = [0-9]* && $1 -lt $2 ]]
then b=$2; else b=59 ; fi

function lotto
{
 for (( i = 0; i <= $2; i++ )); { (( arr[i] = i )); }

 for (( i = 1; i <= $2; i++ ))
 {
   r=$(( (RANDOM % $2) + 1 ))
   (( t=arr[i] )); (( arr[i]=arr[r] )); (( arr[r]=t ))
 }
 
 for (( i = 1; i <= $1 ; i++ )); { str+="${arr[$i]} "; }
 echo "Your Lucky $1 From $2 : $str"
}

lotto $a $b
