#!/bin/bash
# Purpose: Set a command word as an alias to create an empty file, make it executable,
# stage & commit it, and edit the file with vi.
# 
# Author: Daniel Cruz <daniel@mydatacenter.io>
# Last updated on : 17-May-2022
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
alias cutter='read x; touch $x; chmod +111 $x; git add $x; git commit -am "adding $x"; vi $x'

echo -e "Alias set with the keyword 'cutter'.\nType 'unset cutter' anytime you need to get rid of the alias.\n"

echo -e "1. The 'cutter' command will do the following:"
echo -e "2. Prompt for a filename to be created"
echo -e "3. Create that filename"
echo -e "4. Make that filename executable"
echo -e "5. git add 'filename'"
echo -e "6. git commit -am 'filename'"
echo -e "7. vi 'filename'"
echo -e "\n"
