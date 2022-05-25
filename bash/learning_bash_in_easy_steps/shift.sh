#!/bin/bash
clear

echo -e "The positional parameters \$1, \$2, \$3, \$4, etc. are readonly so cannot explicitly be assigned values.\nThey can only contain values specified as comand arguments.\n\nThe \$0 will always contains the script command, the next positional parameters can be manipulated with 'shift' command.\nThis will discard the initial value in \$1 and moves the value in each subsequent positional.\n\n"

echo -e "Let's practice shifting \$1. Execute this script like this: ./shift.sh -o 0 1 2 3\n"

function process_args
{
  while (( $# > 1 ))
  do
    shift
    # shift 2 # We can also shift by multiple spaces specifying an integer
    echo "Argument \$1 shifted: $1"
  done
}

if [[ $1 = '-o' ]]
then
  process_args $@
fi
