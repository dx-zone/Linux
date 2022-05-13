#!/usr/bin/env bash
#

#######################################################
# Downloading the Git completion & Git prompt scripts #
#######################################################
wget https://raw.githubusercontent.com/dx-zone/BASH/main/bachrc/git-prompt.sh -P ~/.git-completion
wget https://raw.githubusercontent.com/dx-zone/BASH/main/bachrc/git-completion.bash -P ~/.git-completion

rm -f ~/.wget-hsts

sleep 3

### Appending aliases to ~/.bashrc ###
cat << EOF >> ~/.bashrc

#####################################################
# Aliases
alias ll='ls -alFihp'
alias la='ls -A'
alias lt='ls -alFihpt'
alias lr='ls -alFihptr'
alias ld='ls -DalFihptr'
alias l='ls -CF'
alias rm='rm -i'
alias now='date +%H:%M'
alias conn='ssh -l root'

EOF

### Appending git-completion and git-prompt & coloring to ~/.bashrc ###
cat << EOF >> ~/.bashrc

#####################################################
# Git
#
# Enable tab completion
source ~/.git-completion/git-completion.bash

# Change command prompt
source ~/.git-completion/git-prompt.sh

# colors!
red="\[\033[38;5;203m\]"
green="\[\033[38;05;38m\]"
blue="\[\033[0;34m\]"
reset="\[\033[0m\]"

export GIT_PS1_SHOWDIRTYSTATE=1

# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$red\u$green\$(__git_ps1)$blue \W
$ $reset"

EOF

source ~/.bashrc


### The following lines are can set to revert the changes done to ~/.bashrc ###
# Uncomment the next line to revert the changes
# cat /etc/skel/.bashrc > ~/.bashrc ; source ~/.bashrc
