# Chrubuntu

Instructions for setting up Chrubuntu on an SD card for use on the Samsung ARM Chromebook

## Put Chromebook in Developer mode
* Hold `ESC` and `REFRESH` as you press the `POWER` button
* Press `CTRL+D`
* Restart
* Enter terminal with `CTRL+ALT+FORWARD`
* Login with user `chronos`
* Run `chromeos-firmwareupdate –mode=todev`

## Install Chrubuntu

* Boot Chromebook but do not log in
* Connect to Wifi
* Enter terminal with `CTRL+ALT+FORWARD`
* Run:
	* wget http://goo.gl/34v87
	* sudo bash 34v87 /dev/mmcblk1


## Fix Touchpad
* `mkdir ~/backup`
* `sudo mv /usr/share/X11/xorg.conf.d/* ~/backup/`
* `cd /usr/share/X11/xorg.conf.d/`
* `sudo unzip x_alarm_chrubuntu.zip /usr/share/X11/xorg.conf.d`

## Fix Suspend
 * Add to ~/.bashrc: `xset -dpms`

## Install Flash Plugin
* `sudo unzip flashplayerarm.tar.gz /usr/lib/chromium-browser/plugins/`


## Fix Audio
* Run `alsamixer` and unmute the following
* Left Speaker Mixer Left DAC1
* Left Speaker Mixer Right DAC1
* Right Speaker Mixer Left DAC1
* Right Speaker Mixer Right DAC1
* Left Headphone Mixer Left DAC1
* Left Headphone Mixer Right DAC1
* Right Headphone Mixer Left DAC1
* Right Headphone Mixer Right DAC1
* `sudo alsactl store`

## Fix Chromium
* Add --user-data-dir to /etc/chromium-browser/default

## Users

* `sudo adduser newuser`
* Add the following to /etc/sudoers
	* `newuser    ALL=(ALL:ALL) ALL`
* Logout and log in as newuser
* `sudo userdel -r user`

## Disable Guest Account

* Add `allow-guest=false` to `/etc/lightdm/lightdm.conf`
* `sudo restart lightdm`