#### Package Installation History on Ubuntu Desktop 22.04 LTS



**Packages installed through APT**

```bash
sudo apt install curl wget terminator ipcalc sipcalc sipcalc irpas arp-scan nmap vim vim-gui-common vim-runtime build-essential xautomation tree python3 python3-pip python3-venv -y
```



**Python Modules**

```bash
pip install jupyterlab lxml
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
alias sshin='ssh -l root'
alias tree='tree -Cl'

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



**Git**

```bash
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update -y
sudo apt install git -y
```


**Sublime**

```bash
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
sudo apt-get install apt-transport-https -y
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update -y
sudo apt-get install sublime-text -y
sudo apt-get install sublime-merge
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
# Set Vagrant repo and install it from it
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" -y

sudo apt-get update && sudo apt-get install vagrant -y

# Install Vagrant VMware Desktop provider
vagrant plugin install vagrant-vmware-desktop

# Apply the licence for the Vagrant vmware-desktop provider
vagrant plugin license vagrant-vmware-desktop ~/Downloads/license.lic

# Create a directory for executable and unpack the executable as root
sudo mkdir -p /opt/vagrant-vmware-desktop/bin

# Download Vagrant VMware Utility
# https://www.vagrantup.com/docs/providers/vmware/vagrant-vmware-utility
# Manual Installation
sudo unzip -d /opt/vagrant-vmware-desktop/bin vagrant-vmware-utility_1.0.21_linux_amd64.zip

# Run utility setup task
sudo /opt/vagrant-vmware-desktop/bin/vagrant-vmware-utility certificate generate

# Install the service
sudo /opt/vagrant-vmware-desktop/bin/vagrant-vmware-utility service install

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

**VMware Workstation 16 Pro**

```bash
# Download and install VMware Workstation 16 Pro for Linux
# https://www.vmware.com/products/workstation-pro/workstation-pro-evaluation.html

chmod +x ./VMware-Workstation-Full-16.2.3-19376536.x86_64.bundle

./VMware-Workstation-Full-16.2.3-19376536.x86_64.bundle

# Apply a fix for unsigned drivers/mod
# "Cannot open /dev/vmmon: No such file or directory" error when powering on a VM (2146460)
# https://askubuntu.com/questions/1096052/vmware-15-error-on-ubuntu-18-4-could-not-open-dev-vmmon-no-such-file-or-dire

sudo vmware-modconfig --console --install-all

openssl req -new -x509 -newkey rsa:2048 -keyout VMWARE_WORKSTATION_16_PRO.priv -outform DER -out VMWARE_WORKSTATION_16_PRO.der -nodes -days 36500 -subj "/CN=VMWARE/"

sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./VMWARE_WORKSTATION_16_PRO.priv ./VMWARE_WORKSTATION_16_PRO.der $(modinfo -n vmmon)

sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./VMWARE_WORKSTATION_16_PRO.priv ./VMWARE_WORKSTATION_16_PRO.der $(modinfo -n vmnet)

tail $(modinfo -n vmmon) | grep "Module signature appended"

sudo mokutil --import VMWARE_WORKSTATION_16_PRO.der
# This will ask you for a password, enter some new password a bit long like `1515vmware`. Reenter same password.
# Reboot, and when reboot you should be presented with a menu with blue screen background, you have to make your way to enroll the key and  enter the password you just created, this happens only once, then  continue to boot.
 
# To test the driver / module installed correctly enter the command
mokutil --test-key VMWARE_WORKSTATION_16_PRO.der

# You should get `VMWARE_WORKSTATION_16_PRO.der is already enrolled` and that means VMWare should be working.

```


**JupyterLab**

```bash
pip install jupyterlab

```

