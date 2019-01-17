# Kali Backports Install

Simple script to install Kali backports on Debian base distro.

Tested on:
* Debian 9
* Ubuntu 18

### Prerequisites

```
apt install git
```

### Installing

Get install.sh
```
git clone https://github.com/bambish/Kali-Backports-Install.git
```

Launch install.sh
```
cd Kali-Backports-Install
chmod +x install.sh
./install.sh
```
Press 'Enter' x3 to:
* Add contrib
* Add non-free
* Add sources of packages

### Test the backports

```
apt search metasploit-framework
```