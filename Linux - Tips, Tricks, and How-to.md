## Linux - Tips, Tricks, and How-to

This is a collection of byte sized information on Linux tips, tricks, and how-tos.



#### How to add an user or group to sudoer privilege and disable password prompt when issuing a command with sudo

Be aware that when multiple entries in the `/etc/sudoers` match for a user, they are applied in order. Where there are multiple matches, the last match is used (which is not  necessarily the most specific match).

If you want to override entries in `/etc/sudoers` just put the new entries after them.

The new entry should look like

`myuser ALL=(ALL) NOPASSWD: ALL` for a single user, or

`%sudo  ALL=(ALL) NOPASSWD: ALL` for a group.

Unlike `/etc/sudoers`, the contents of `/etc/sudoers.d` survive system upgrades, so it's preferable to create a file there than to modify `/etc/sudoers`. 



Example

```bash
$ visudo -f /etc/sudoers.d/my_user
# Users allowed to run as root, no password asked.
user ALL=(ALL) NOPASSWD: ALL

$ visudo -f /etc/sudoers.d/my_group
# Members of the user_group are allowed to run as root, no password asked.
%user_group ALL=(ALL) NOPASSWD: ALL

# Users in the veracryptusers group are allowed to run veracrypt as root.
%veracryptusers ALL=(root) NOPASSWD:/usr/bin/veracrypt
```



***Quick trick to allow the current user to skip sudo password prompt***

```bash
sudo echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee "/etc/sudoers.d/dont-prompt-$USER-for-sudo-password"
```



#### How to set a proxy server and check Internet connectivity on Linux

Assuming your already have a proxy server and you want to test Internet or network access through it, you can use `curl -x <proxy_ip:proxy_port>`.

```bash
curl -x 10.113.28.7:3128 www.google.com
```



***Quick trick***
Set the proxy as a shell variable and test the proxy connection. This will save you time re-typing long values over and over.

```bash
PROXY=http://10.113.28.7:3128
curl -x $PROXY www.google.com
```



#### How to know what packages or list installed packages on Ubuntu and Debian based Linux

Debian and therefore Debian based distributions such as Ubuntu, counts with multiple tools that can be used to manage Debian packages, "from graphic or text-based interfaces to the low level tools used to install packages.'' (https://www.debian.org/doc/manuals/debian-faq/pkgtools.en.html).

The most common tools for package management for Debian based distributions are:
`dpkg`, `apt`, `aptitude`, `synaptic`, and `tasksel`. 

In addition, the `snap` tool can be included in some Linux distributions (such as Ubuntu) to download a ''bundle of an app and its dependencies that works without modification across many different Linux distributions" (https://snapcraft.io/docs/getting-started) from [Snap Store](https://snapcraft.io/store)

Here is a list of example commands on how to use these tools to list installed packages:

```bash
# To list packages using apt command
apt list --installed
apt list --installed | grep program_name
apt -qq list program_name --installed

# To list packages using dpkg command
dpkg-query -l

# To list Snap packages installed on your system
snap list

# List the recently installed packages
grep " install " /var/log/dpkg.log
grep " install " /var/log/apt/history.log



```



How to find the Linux kernel version and its installed date

```bash
uname -ar
# Linux <hostname> <version> <distribution> <compiled date and time> <architecture>

uname -ar
# Linux lmntrix 5.13.0-40-generic #45-Ubuntu SMP Tue Mar 29 14:48:14 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux

```



#### Enabling Vi/VIM Syntax Colors and Highlighting

Vi/VIM can be set to highlight syntax colors, line numbering, and much more, just like modern code editors. The following vi commands are a good starting point to turn on highlighting, color and numbering.

```bash
sudo apt-get install vim-gui-common
sudo apt-get install vim-runtime

vi test
:version
:q

vi ~/.vimrc
:syntax on
:colorscheme desert
:set number
```



**Set Vi/VIM Settings Permanently**
This is ideal to have the settings permantly whenever vi/vim is launched. Color schemes to choose are:

* default
* elford
* torte
* delek
* evening
* pablo
  

```bash
cat << EOF > ~/.vimrc
set number
syntax on
colorscheme desert
```



**Sublime Monokai Color Scheme for Vi/VIM**

**Quick Trick** - Download a vim-sublime-monokai color scheme from ErichDonGubler repo and set it up on your vi/vim resource file `~/.vimrc`

```bash
sudo apt-get install vim-gui-common

sudo apt-get install vim-runtime

mkdir -p ~/.vim/colors

cd ~/.vim/colors

# Maintainer: Erich Gubler (erichdongubler)
# URL: https://github.com/erichdongubler/vim-sublime-monokai
# License:    MIT
wget https://raw.githubusercontent.com/erichdongubler/vim-sublime-monokai/master/colors/sublimemonokai.vim

cat << EOF > ~/.vimrc
set number
syntax on
colorscheme sublimemonokai
EOF
```



#### Setting a Network Interface with the Network Manager Tool `nmcli`

**Display network connections with `nmcli`**

```bash
nmcli
nmcli device
nmcli device show
nmcli connection show
```



**Setup the network connections with `nmcli`**
Replace `"Wired connection 1"` with the actual connection name displayed when issuing the `nmcli` command, as well as the `ipv4.addresses 1.1.1.14/28` and `ipv4.gateway 1.1.1.1/28` with the actual IP and gateway for your network.

```bash
nmcli connection modify "Wired connection 1" ipv4.method manual ipv4.addresses 1.1.1.14/28 ipv4.gateway 1.1.1.1/28

hostname -I

nmcli device show
```



**Rename the current network connection with `nmcli`**

```bash
nmcli connection modify "Wired connection 1" connection.interface-name "external-2"
```



#### Display CPU Information



```bash
nproc # Print the number of processing units available

cat /proc/cpuinfo # Print CPU and system architecture details
```



#### How to Encrypt Your Home Folder After Installing Ubuntu

Packages to install:

`ecryptfs`

`cryptsetup`



**Steps to Accomplish**

* Install encryption tools
* Create a temporary user to work with as the one to be encrypted need to be logged off
* Log off from current user account to be encrypted
* Log on as root or as a temporary user with sudo privileges
* Set an encryption pass-phrase
* Encrypt and migrate the current user account to the encrypted home directory
* Encrypt the swap partition



**Install Encryption Utilities**

```bash
sudo apt-get install ecryptfs-utils cryptsetup
```



**Create a Temporary User with Administrative Privileges**

```bash
# Replace the value of the TEMPUSER variable with the name of a temporary username
#TEMPUSER="temporary-username-goes-here"
#TEMPPASS="password-for-temporary-user-goes-here"

TEMPUSER="temp_user_2_delete"
TEMPPASS="password"

useradd $TEMPUSER # create a temporary user to work with
echo "$(echo $TEMPPASS)" | passwd $TEMPUSER --stdin # set the password for the temp user
usermod -aG sudo tempuser # add the temporary user to sudo group to grant sudo privileges

id $(echo $TEMPUSER) # verify the user attributes
```



**Log Out The Current User Account to be Encrypted and Log In with the New Temporary User Account**

```bash
gnome-session-quit # Logout from current user account
gnome-session-quit --no-prompt # Logout from current user account without prompt
```



**Migrating and Encrypting Your Home Folder**

```bash
# Replace the value of the USER variable with the name of your user account
USER="user-account-goes-here"
sudo ecryptfs-migrate-home -u $USER
```


**Clean Up After Completing the Migration** 

```bash
sudo ecryptfs-unwrap-passphrase # command to view this passphrase
sudo ecryptfs-setup-swap # encrypt the swap partition
sudo rm -rf /home/user.random
```



**Shout Out To**

https://www.cyberciti.biz/faq/add-new-user-account-with-admin-access-on-linux/

https://www.howtogeek.com/116032/how-to-encrypt-your-home-folder-after-installing-ubuntu/

https://vitux.com/4-ways-to-log-out-of-a-ubuntu-desktop-session/#:~:text=Open%20the%20Ubuntu%20command%20line,Ctrl%2BAlt%2BT%20shortcut.&text=When%20you%20run%20this%20command,clicking%20the%20Log%20Out%20button.

**How to Make Keyboard Works Like OSX System Wide**

If you install the `xautomation` package, you can add a command in System → *Preferences* → *Keyboard Shortcuts* → *Custom* like:

```bash
sudo apt install xautomation

# System → *Preferences* → *Keyboard Shortcuts* → *Custom* like:
# xte "keyup Meta_L" "keyup Meta_R" "keyup c" "keydown Control_L" "key c" "keyup Control_L"

```

