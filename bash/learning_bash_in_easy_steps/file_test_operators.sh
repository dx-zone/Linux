#!/bin/bash
# Purpose: Bash Shell: Check File Exists or Not
# Author: 
# Note : 
# Last updated on : 16-May-2022
# -----------------------------------------------
clear

echo -e "\nFile test operators\n"

#echo -e "-----------------------------------------------------------------------------\n"
echo -e "Example:\n\nif [ operator FileName ]\nthen\n\techo 'FileName - Found, take some action here'\nelse\n\techo 'FileName - Not found, take some action here'\nfi\n"

echo -e "-----------------------------------------------------------------------------\n"

echo " ____________________________________________________________________________ "
echo "|  Operator      |  Description                                              |"
echo " ____________________________________________________________________________ "
echo "|    -b FILE     | FILE exists and is block special                          |"
echo "|    -c FILE     | FILE exists and is character special                      |"
echo "|    -d FILE     | FILE exists and is a directory                            |"
echo "|    -e FILE     | FILE exists                                               |"
echo "|    -f FILE     | FILE exists and is a regular file                         |"
echo "|    -g FILE     | FILE exists and is set-group-ID                           |"
echo "|    -G FILE     | FILE exists and is owned by the effective group ID        |"
echo "|    -h FILE     | FILE exists and is a symbolic link (same as -L)           |"
echo "|    -k FILE     | FILE exists and has its sticky bit set                    |"
echo "|    -L FILE     | FILE exists and is a symbolic link (same as -h)           |"
echo "|    -O FILE     | FILE exists and is owned by the effective user ID         |"
echo "|    -p FILE     | FILE exists and is a named pipe                           |"
echo "|    -r FILE     | FILE exists and read permission is granted                |"
echo "|    -s FILE     | FILE exists and has a size greater than zero              |"
echo "|    -S FILE     | FILE exists and is a socket                               |"
echo "|    -t FILE     | FD  file descriptor FD is opened on a terminal            |"
echo "|    -u FILE     | FILE exists and its set-user-ID bit is set                |"
echo "|    -w FILE     | FILE exists and write permission is granted               |"
echo "|    -x FILE     | FILE exists and execute (or search) permission is granted |"
echo -e " ____________________________________________________________________________ \n"

echo -e "Let's do some exercises:\n"

echo 'file="/etc/hosts"'
echo 'if [ -f "$file" ]'
echo 'then'
echo '	echo "$file found."'
echo 'else'
echo '	echo "$file not found."'
echo -e 'fi\n'


echo -e "\nChecking if the '/etc/hosts' file exist\n"
file="/etc/hosts"
if [ -f "$file" ]
then
	echo "$file found."
else
	echo "$file not found."
fi
