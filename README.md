# void.sh

void-sh is a program written in Bash that configures Void Linux.

### Content

- Update the system
- Install recommended packages
- Install development packages
- Install a other Shell and make it default (1/14) (optional)
	- Fish, Zsh
- Install the X Window System (2/13) (optional)
- Install a Desktop environment (3/13) (optional)
    - Xfce, MATE, GNOME, KDE Plasma, Budgie, Cinnamon, LXQt, Enlightenment,
	- LXDE, Lumina
- Install Display Manager (4/13) (optional)
    - LightDM, emptty, slim
- Install a Window manager (5/13) (optional)
    - i3wm, Openbox, Fluxbox, bspwm, herbstluftwm, IceWM, awesome, jwm, dwm, FVWM3,
	- Wayfire, Sway
- Install fonts (6/13) (optional)
- Install an Internet browser (7/13) (optional)
	- Firefox, Firefox ESR, Chromium, Qutebrowser, Falkon, Badwolf
- Install LibreOffice (8/13) (optional)
- Install GIMP + Inkscape (98/13) (optional)
- Install QEMU + Virt Manager (10/13) (optional)
- Install a Terminal emulator (11/13) (optional)
    - Alacritty, Xterm, VXTerminal, Yakuake, Sakura, Kitty
- Install a Backup program (12/13)
- Install a Video player (13/13)
	- mpv, VLC, Parole, Totem
- Enable required services (14/13)
- Configure Cron
- Configure Audio (optional)
- Configure Network Management (optional)
	- Connman, Network Manager
- Configure Bluetooth (optional)
- Configure Printing support (optional)
- Configure TLP for notebook power saving (optional)
- Configure the Display manager (REQUIRES STEP 3/4)
- Start the Display manager (optional)
### How to use

Please make sure git is installed: <br><br>
`xbps-install -S git`

Then run: <br><br>
`git clone https://codeberg.org/fossraven/void-sh.git` <br>
`cd void-sh` <br>
`sudo sh void.sh`

This script should be executed as root because it must execute the package manager
and copy some configuration files.

### Notes

- This program is not part of Void Linux.
- This program must be bit more tested for use on production systems.