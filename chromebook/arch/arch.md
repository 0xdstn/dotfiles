# Arch Linux

Instructions for setting up arch linux on an SD card for use on the Samsung ARM Chromebook 
## Put Chromebook in Developer mode
* Hold `ESC` and `REFRESH` as you press the `POWER` button
* Press `CTRL+D`
* Restart
* Enter terminal with `CTRL+ALT+FORWARD`
* Login with user `chronos`
* Run `chromeos-firmwareupdate –mode=todev`

## Install Arch

* [http://archlinuxarm.org/platforms/armv7/samsung/samsung-chromebook](http://archlinuxarm.org/platforms/armv7/samsung/samsung-chromebook)

## Install Awesome WM
* `sudo pacman -S xorg-server xorg-xinit xorg-server-utils mesa xf86-video-fbdev xf86-input-synaptics awesome xterm transset-df unzip acpi`
* `cd /etc/X11/xorg.conf.d/`
* `sudo rm *`
* `sudo unzip x_alarm_chrubuntu.zip /usr/share/X11/xorg.conf.d`
* `sudo cp /etc/skel/.xinitrc ~/.xinitrc`

Add the following to the bottom of `~/.xinitrc`:

	xrdb -merge ~/.Xresources 
	exec awesome


## MS Fonts
* `sudo unzip msfonts.zip /usr/share/fonts/TTF/`\
* `fc-cache -vf`
* `mkfontscale`
* `mkfontdir`

## Fix Audio
* Run `alsamixer` and unmute the following
	* DMIC1 Left
	* DMIC1 Right
	* Left ADC Mixer MIC2
	* Left Headphone Mixer Left DAC1
	* Left Headphone Mixer Right DAC1
	* Left Speaker Mixer Left DAC1
	* Left Speaker Mixer Right DAC1
	* MIC2 External Mic
	* Right ADC Mixer MIC2
	* Right Headphone Mixer Left DAC1
	* Right Headphone Mixer Right DAC1
	* Right Speaker Mixer Left DAC1
	* Right Speaker Mixer Right DAC1
* `alsactl store`

## Fix Suspend

* `pacman -S acpid pm-utils`

Edit /etc/acpi/handler.sh and near the bottom you'll see the button/lid section. Add pm-suspend to the close section to look like:

    button/lid)
        case "$3" in
            close)
                logger 'LID closed'
                pm-suspend
                ;;
                
* `systemctl enable acpid`
* `systemctl start acpid`

## Enable brightness
* `touch /etc/tmpfiles.d/brightness.conf`
* Edit that with the following (The brightness file location may vary, so check that it is correct):
	* `f /sys/class/backlight/backlight.12/brightness 0666 - - - 800`
* `ln -s /sys/class/backlight/backlight.12/brightness /brightness`
* You can now change the brightness like so: `echo 1000 > /brightness` You can set it from 0 - 2800

## Fix timezone
* `sudo ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime`

## Disable Lynx Cookies
* Make the following changes in `/etc/lynx-cur/lynx.cfg`:
	* `SET_COOKIES:FALSE`
	* `ACCEPT_ALL_COOKIES:FALSE`
	* `PERSISTENT_COOKIES:FALSE`
	* `#COOKIE_FILE:~/.lynx_cookies`

## Users
* `passwd root`
* `useradd newuser`
* `passwd newuser`
* `usermod -aG wheel,video,audio newuser`
* In `/etc/sudoers` find the commented line `%wheel ALL=(ALL) ALL` and uncomment it.
* `mkdir /home/newuser`
* `chown newuser /home/newuser`

## Setting up terminal

* `pacman -S rxvt-unicode`
* `unzip inconsolata-g_font.zip`
* `cp Inconsolata-g.* /usr/share/fonts/`
* `fc-cache -vf`
* Comment out the following line in .vimrc:
  * `let g:solarized_termcolors=256`

