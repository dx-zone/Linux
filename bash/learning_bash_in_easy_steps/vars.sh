#!/bin/bash
clear
echo -e "Variables that are declared in a script outside any function definition are globally assesible to any function, so the variable values can be readily displayed and manipulated. The copies of the variable values can be passed to functions in positional parameters.\n"

echo -e "Globally accesible variables are declared outside a function and their values can be readily displayed and manipulated and their values can be passed to functions in positional parameters.\n"

echo -e "Now lets declare some variables and call them gobally and within a function.\n"

var='Bash in easy steps'
arr=(Alpha Bravo Charlie)

function show_vars
{
  echo $var
  echo ${arr[@]}
  var='C Programming in easy steps'
}

show_vars

function show_params
{
  str=$@
  echo $str
}
show_params $var
