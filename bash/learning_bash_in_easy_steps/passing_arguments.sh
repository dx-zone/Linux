#!/bin/bash

echo -e "You passed: $@\n"

x=$@

echo -e "I stored the arguments passed ($@) in the variable x which resolves to '$x'.\n"
echo -e "and the total of the argument passed are: $#"
