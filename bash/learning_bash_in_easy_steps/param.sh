#!/bin/bash

# $@ retrievess a spaced-separated list of passed values
# $# retrieves an integer that is the total number of passed values

echo -n 'Please enter your name '
read var
echo "Welcome to $@, $var"
echo "You passed $# values/parameters"
