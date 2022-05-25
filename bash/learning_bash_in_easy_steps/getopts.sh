#!/bin/bash

function process_options
{
  case $option in
  a ) echo "Selected $option" ;;
  b ) echo "Selected $option with argument: $OPTARG";;
  c ) echo "Selected $option" ;;
  * ) echo 'Usage: getopts [-a] [-b arg] [-c]' ;;
  esac
}
