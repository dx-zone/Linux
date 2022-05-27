#!/bin/bash
# Purpose: Set a command word as an alias to create an empty file, make it executable,
# stage & commit it, and edit the file with vi.
# 
# Author: Daniel Cruz <daniel@mydatacenter.io>
# Last updated on : 27-May-2022
#
# Note: I found myself typing the same thing over and over when creating scripts
# and staging them to be tracked by git.
# So, this is script to set the word 'cutter' as an alias or a a shortcut
# to reduce typing and speed up the process for the following workflow
# 1) Prompt for a filename to be created
# 2) Create an empty filename
# 3) Make the file executable
# 4) Track the file with git (stage the file with 'git add')
# 5) Take a snapshot of the file (save current state with git commit -am 'adding X file)  
# 6) Edit the file with vi
#
alias cutter='read -p "Enter a filename. Example: my_script.sh: " x; touch $x; chmod +111 $x; git add $x; git commit -am "adding $x"; vi $x'

echo -e "Alias set with the keyword 'cutter'.\nType 'unset cutter' anytime you need to get rid of the alias."
echo -e "Type 'type cutter' anytime you want to find what the alias does."
echo -e "Type 'cutter' anytime you want to do the following workflow.\n"

echo -e "The 'cutter' command will do the following:"
echo -e "1. Prompt for a filename to be created"
echo -e "2. Create that filename"
echo -e "3. Make that filename executable"
echo -e "4. git add 'filename'"
echo -e "5. git commit -am 'filename'"
echo -e "6. vi 'filename'\n"
echo -e "Enjoy!\n"
