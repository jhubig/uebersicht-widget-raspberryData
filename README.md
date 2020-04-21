[![GitHub release](https://img.shields.io/github/release/jhubig/raspberryData/all.svg?maxAge=1)](https://GitHub.com/jhubig/raspberryData/releases/)
[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)
[![GitHub license](https://img.shields.io/github/license/jhubig/raspberryData.svg)](https://github.com/jhubig/raspberryData/blob/master/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/jhubig/raspberryData.svg)](https://GitHub.com/jhubig/raspberryData/issues/)
[![GitHub issues-closed](https://img.shields.io/github/issues-closed/jhubig/raspberryData.svg)](https://GitHub.com/jhubig/raspberryData/issues?q=is%3Aissue+is%3Aclosed)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/jhubig/raspberryData/issues)
[![GitHub contributors](https://img.shields.io/github/contributors/jhubig/raspberryData.svg)](https://GitHub.com/jhubig/raspberryData/graphs/contributors/)
[![Github All Releases](https://img.shields.io/github/watchers/jhubig/raspberryData?style=social)](https://github.com/jhubig/raspberryData/watchers)

# raspberryData widget
Widget for Übersicht http://tracesof.net/uebersicht/ to display data of your Raspberry

![banner.png](img/banner.png?raw=true "raspberryData widget")

---

## Features

Currently the following data is collected from your Raspberry Pi

| Name | Command
| --- | --- |
| Device Model | `cat /sys/firmware/devicetree/base/model` |
| OS Release Name | `cat /etc/os-release  \| grep "PRETTY_NAME" \| awk -F"=" '{print $2}' \| sed 's/"//g'` |
| kernelVersion | `uname -r` |
| IP Address | `hostname -I \| awk '{print $1}'` |
| Uptime | `uptime -p` |
| CPU Model | `cat /proc/cpuinfo \| grep "model name" \| awk -F":" '{print $2}'` |
| CPU Type | `cat /proc/cpuinfo \| grep "Hardware" \| awk -F":" '{print $2}' \| tr -d " "` |
| CPU Revision | `cat /proc/cpuinfo \| grep "Revision" \| awk -F":" '{print $2}' \| tr -d " "` |
| CPU Temperature | `/opt/vc/bin/vcgencmd measure_temp \| tr -d "temp=" \| tr -d "'C"` |
| Running processes | `/bin/ls -d /proc/[0-9]* \| wc -l'` |
| Memory usage (Total) | `free -m -t \| grep 'Mem' \| awk '{print $2}'` |
| Memory usage (Free) | `free -m -t \| grep 'Mem' \| awk '{print $3}'` |
| Disk usage | `df -hP \| grep root \| tr -s " " " " \| sed 's/G//g' \| sed 's/%//g'` |

**Becoma a part of it**   
Do you have any ideas to improve or extend the existing functionality? Feel free to raise an issue or create a pull request. Thanks.


## Setup

### 1. Create ssh keys for passwordless access

First prerequisite is, that you have enabled ssh on your Raspberry Pi. You can find instructions here: https://www.raspberrypi.org/documentation/remote-access/ssh/

After that to be able to get the data out of your Raspberry Pi without the need of entering a password, ssh keys need to be created (More info about that can be found here: https://www.raspberrypi.org/documentation/remote-access/ssh/passwordless.md). Open a terminal on your Mac and go to your home directory /Users/<yourUser>/ (Enter cd ~ in the terminal and press enter):

Now start the generation of the keys:

```shell
ssh-keygen
```

- [x] Save the keys in the file /Users/<yourUser>/.ssh/id_rsa when prompted - should be the default location
- [x] Enter NO passphrase (just press two times ENTER when prompted)

Then copy the keys to your Raspberry Pi:

```shell
ssh-copy-id <USERNAME>@<IP-ADDRESS>
```

Now once for copying the file, the password needs to be entered. After logging in the next time on your Raspberry PI through ssh, no password is needed anymore.

### 2. getData.sh file for config

First of all you need to enter your username and hostname of your Raspberry Pi in the getData.sh file:

```shell
# Configuration\
username='your username'\
hostname='ip address or hostname of raspberry'
```

Afterwards you need to make the file executable:
Open a terminal and go to the widget folder (usually located under /Users/<yourUser/Library/Application Support/Übersicht/widgets/raspberryData.widget/). Then apply the following:

```shell
chmod 755 raspberryData.sh
``` 

### 3. Start the engines

If steps 1 and 2 were successful, then you should see already data of your Raspberry Pi on your widget on the desktop. Enjoy :)
Now you can change the position of the widget in the index.coffee file:

```shell
# Position of the widget on your screen\
pos_top		= '180px'\
pos_left	= '330px'
```

----

## Version History
- `1.0` - Initial Release (TBC)

----

The "Raspberry Pi" and the Raspberry logo are registered trademark(s) of the Raspberry Pi Foundation: https://www.raspberrypi.org/

© 2020 | Johannes Hubig
