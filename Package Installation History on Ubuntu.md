#### Package Installation History on Ubuntu Desktop 22.04 LTS



**Packages installed through APT**

```bash
sudo apt install curl wget terminator ipcalc sipcalc sipcalc irpas arp-scan nmap vim-gui-common vim-runtime -y
```



**BASH Terminal Configuration**

```bash
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

#####################################################
# Downloading and setting Git completion & Git prompts scripts
wget https://raw.githubusercontent.com/dx-zone/BASH/main/bachrc/git-prompt.sh -P ~/.git-completion

wget https://raw.githubusercontent.com/dx-zone/BASH/main/bachrc/git-completion.bash -P ~/.git-completion

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
```



**Sublime**

```bash
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https -y
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update -y
sudo apt-get install sublime-text -y
```


**Typora**

```bash
for Linux
Download Typora.deb
or

# or run:
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE

wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -

# add Typora's repository

sudo add-apt-repository 'deb https://typora.io/linux ./'

sudo apt-get update

# install typora

sudo apt-get install typora
```



**Vagrant**

```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" -y

sudo apt-get update && sudo apt-get install vagrant -y
```



**Docker**

```bash
sudo apt-get update -y

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
    
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
 
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

sudo docker run hello-world -y

```

