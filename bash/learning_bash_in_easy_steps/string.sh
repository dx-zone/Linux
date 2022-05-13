#!/usr/bin/env bash
# Handling Strings
#echo ${1:-'Default value provided for absent argument!'} '${var:-1}'
var=$1
#echo $var
echo ${var:='Variable "var" is undefined in this script!'} '${var:=}'
echo ${1:?'No argument passed!'} '${var:?}'
echo ${1:+'Argument received!'} '${var:+}'
echo ${1:0:4} '${var:pos:len}'
#
# Operators / Description
# ${var:-string} / Return var value, or string | Provide a default value when no value has been assigned
# ${var:=string} / Return var value, or string - but cannot be used to test positional parameter
# ${var:?string} / Return var value, or string, then exit script
# ${var:+string} / Return string, or null if absent
# ${var:pos:len} / Return substring of var of lenght len starting at character position pos
echo $var