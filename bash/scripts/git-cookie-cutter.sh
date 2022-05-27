#!/bin/bash
#!/bin/bash
# Purpose: Create an empty file, make it executable,
# stage & commit it, and edit the file with vi.
# 
# Author: Daniel Cruz <daniel@mydatacenter.io>
# Date : 27-May-2022
#
# Note: I found myself typing the same thing over and over when creating scripts
# and staging them to be tracked by git.
# So, this is script will reduce typing and speed up the process for the following workflow
# 1) Create an empty filename
# 2) Make the file executable
# 3) Track the file with git (stage the file with 'git add')
# 4) Take a snapshot of the file (save current state with git commit -am 'adding X file)  
# 5) Edit the file with vi
#

# Save arguments passed in the variable x 
x=$@

# Check if argument has been pass to create an alias, otherwise prompt the user 
if [[ $# == 0 ]]
then
  echo "Type a filename. For example: ./cutter my_script.sh"
else
  echo "Filename typed: $@"
  touch $x ; chmod +111 $x ; git add $x ; git commit -am "adding $x" ; vi $x
fi
