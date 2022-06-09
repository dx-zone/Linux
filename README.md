# Linux BASH Scripts



This is a collection of scripts, tips and how-tos for Linux and BASH.



#### Colorized your BASH shell prompt to reflect your current git branch repos you are working at and colorized you vi/vim editor to look like SublimeText with Monokai like color scheme.


This script will turn your vi/vim to look like if your were editing code in SublimeText with Monokai color scheme like. In addition, it will colorized your shell prompt to reflects your git branch when working on directories that holds git repos. Be aware, there are some custom alias in the following scripts. Is up to you if you want to keep them or add whatever you like.



**Requirements**

* **Debian** based **Linux** distributions will require full `vim` version (not the tiny version that gets shipped with most Linux distros) and the related vim common tools, plus, `wget` to download additional scripts.

  ```bash
  readlink -f `which vi` # This will tell which vi/vim version is installed, it should be vim.tiny in most cases.
  
  sudo apt install vim vim-gui-common vim-runtime wget -y
  
  readlink -f `which vi` # This will tell which vi/vim version is installed, it should be vim.basic after installing vi/vim full version
  ```

* Mac OX X will require wget, and such, we are including instructions to install it with `brew`.

  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  brew install wget
  ```

  

Copy and paste the following code below in your BASH terminal. This will download `git-completion.bash` and `git-prompt.sh` and store them in your home directory at `~/.git-completion`. Then the `~/.bashrc` will be modified to load these and change the BASH prompt.



```bash
#!/usr/bin/env bash
# Purpose: Colorized BASH shell prompt to reflects current git branch being worked at and colorized vi/vim to look like SublimeText with Monokai color scheme.
# Author: Daniel Cruz <daniel@mydatacenter.io>
# Last updated on : 2-Jun-2022

#######################################################
# Downloading the Git completion & Git prompt scripts #
#######################################################
wget https://raw.githubusercontent.com/dx-zone/Linux/main/bachrc/git-prompt.sh -P ~/.git-completion
wget https://raw.githubusercontent.com/dx-zone/Linux/main/bachrc/git-completion.bash -P ~/.git-completion

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
alias sshin='ssh -l root'
alias tree='tree -Cl'

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

# To revert the changes, uncomment the line below or copy and paste it in your terminal without the # symbol
# cat /etc/skel/.bashrc > ~/.bashrc ; source ~/.bashrc ; rm -fr ~/.git-completion

```



#### Add sudo privileges and skip the password prompt for the current user logged in the terminal

The following code will generate a file at `/etc/sudoers.d/dont-prompt-$USER-for-sudo-password` with the parameters to provide sudo privileges and skipping password prompt to the current user logged in the terminal.  The current user logged will be determined based on the environment variable USER. Echo this variable in case you need to know which user is currently logged in the terminal like so: `echo $USER`

```bash
sudo echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee "/etc/sudoers.d/dont-prompt-$USER-for-sudo-password"
```



### Set vi/vim color scheme like Sublime/Monokai

```bash
sudo apt-get install vim-gui-common vim-runtime -y

mkdir -p ~/.vim/colors

# Maintainer: Erich Gubler (erichdongubler)
# URL: https://github.com/erichdongubler/vim-sublime-monokai
# License:    MIT
curl https://raw.githubusercontent.com/erichdongubler/vim-sublime-monokai/master/colors/sublimemonokai.vim -o ~/.vim/colors/sublimemonokai.vim

cat << EOF > ~/.vimrc
set number
syntax on
colorscheme sublimemonokai
EOFcp -a 
```
