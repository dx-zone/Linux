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
wget https://raw.githubusercontent.com/dx-zone/Linux/main/bash/bachrc/git-prompt.sh -P ~/.git-completion
wget https://raw.githubusercontent.com/dx-zone/Linux/main/bash/bachrc/git-completion.bash -P ~/.git-completion

rm -f ~/.wget-hsts

sleep 3

### Backup existing .bashrc file
cp ~/.bashrc ~/.bashrc.bak

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

### Alias for SSH Tunnel
### Variables to set the SSH Tunneling command
TARGET='host.example.net'  # This is the server we want to SSH in to tunnel that server's port back to our local machine port
LOCAL_HOST_PORT=4443  # Port number in our local machine that will map/tunnel back the remote server's port (HTTPS/443 in our example) in our local machine
LOCAL_HOST_IP='localhost' # This could be localhost (127.0.0.1) or the IP of the local machine
TARGET_SRC_PORT=443  # Port number of the remote server we want to tunnel
SSH_USER='my_ssh_user_goes_here'

### Creating an alias for the SSH Tunnel
alias tunn="ssh -L $LOCAL_HOST_PORT:$LOCAL_HOST_IP:$TARGET_SRC_PORT -p 22 -l $SSH_USER $TARGET -N -f"


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

# To revert the changes in Linux, uncomment the line below or copy and paste it in your terminal without the # symbol
# cat /etc/skel/.bashrc > ~/.bashrc ; source ~/.bashrc ; rm -fr ~/.git-completion

# To revert the changes in MacOS X, uncomment the line below or copy and paste it in your terminal without the # symbol
# cat ~/.bashrc.bak > ~/.bashrc

```



### Colorize and Highlight Your Code with VI/VIM Editor
### Turn your VI/VIM Editor to Look Like SublimeText Editor/Visual Studio Code with Monokai Theme Like
### Set vi/vim color scheme like Sublime/Monokai and set Vim plugin manager with Fugitive & Tagbar Plugins (to enhance VIM with Git and code editing features, highly recommended to work with Cpython programming)

```bash
# Debian based Linux
sudo apt-get install vim-gui-common vim-runtime -y

# Red Hat/CentOS based Linux - VIM with colors
sudo yum install vim-enhanced -y
if [ -n "$BASH_VERSION" -o -n "$KSH_VERSION" -o -n "$ZSH_VERSION" ]; then
  [ -x /usr/bin/id ] || return
  ID=`/usr/bin/id -u`
  #[ -n "$ID" -a "$ID" -le 200 ] && return  ### hash out this line
  # for bash and zsh, only if no alias is already set
  alias vi >/dev/null 2>&1 || alias vi=vim
fi

cat << EOF >> /etc/profile.d/vim.sh
if [ -n "$BASH_VERSION" -o -n "$KSH_VERSION" -o -n "$ZSH_VERSION" ]; then
  [ -x /usr/bin/id ] || return
  ID=`/usr/bin/id -u`
  #[ -n "$ID" -a "$ID" -le 200 ] && return  ### hash out this line
  # for bash and zsh, only if no alias is already set
  alias vi >/dev/null 2>&1 || alias vi=vim
fi
EOF
source /etc/profile.d/vim.sh
# ENDS Red Hat/CentOS based Linux - VIM with colors

mkdir -p ~/.vim/colors

# Maintainer: Erich Gubler (erichdongubler)
# URL: https://github.com/erichdongubler/vim-sublime-monokai
# License:    MIT
curl https://raw.githubusercontent.com/erichdongubler/vim-sublime-monokai/master/colors/sublimemonokai.vim -o ~/.vim/colors/sublimemonokai.vim

cat << EOF > ~/.vimrc
" The following settings can be disabled by adding a " symbol in front of the line
syntax on                     " Enable syntax highlighting.
set number                    " Set line numbering.
filetype plugin indent on  " Enable file type based indentation.
set autoindent             " Respect indentation when starting a new line.
set expandtab              " Expand tabs to spaces. Essential in Python.
set tabstop=4                 " Number of spaces tab is counted for.
set shiftwidth=4              " Number of spaces to use for autoindent.
set backspace=2               " Fix backspace behavior on most terminals.
"colorscheme murphy           " Set colorscheme to murphy.
colorscheme sublimemonokai    " Set colorscheme to Monokai theme.
set list                      " Toggle list mode - to see special characters using specific symbols, including space characters
set listchars=tab:→\ ,eol:¶   " Customize the characters used for displaying tabs, end-of-lines, and other special characters
set listchars+=space:.        " Set space character - to display white spaces as . (periods)


" Setting up VIM to support Vundle Plugin Manager (https://github.com/VundleVim/Vundle.vim.git)
" Highly recommended to work with Cpython programming for custom Python implementations
set nocompatible              " be iMproved, required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of differentsz formats supported.
" Keep Plugin commands between vundle#begin/end.
" plug on Git repo
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
" All of your Plugins must be added before this line
call vundle#end()              " required
filetype plugin indent on              " reqquired
" Open tagbar automatically in C files, optional
autocmd FileType c call tagbar#autoopen(0)
" Open tagbar automatically in Python files, optional
autocmd FileType python call tagbar#autoopen(0)
" Show status bar, optional
set laststatus=2
" Set status as git status (branch), optional
set statusline=%{FugitiveStatusline()}
" Now download Vundle with the following command: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" then execute in your shell the following command in order to set up Vundle and the plugins: vim +PluginInstall +qall

EOF

# Download and install VI/VIM Vundle Plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

```



#### Add sudo privileges and skip the password prompt for the current user logged in the terminal

The following code will generate a file at `/etc/sudoers.d/dont-prompt-$USER-for-sudo-password` with the parameters to provide sudo privileges and skipping password prompt to the current user logged in the terminal.  The current user logged will be determined based on the environment variable USER. Echo this variable in case you need to know which user is currently logged in the terminal like so: `echo $USER`

```bash
sudo echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee "/etc/sudoers.d/dont-prompt-$USER-for-sudo-password"
```



