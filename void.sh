#!/bin/bash

#
# - Update the system
# - Install recommended packages
# - Install development packages
# - Install the X Window System (1/13)
# - Install a Desktop environment (2/13)
# - Install a Display manager (3/13)
# - Install a Window manager (4/13)
# - Install fonts (5/13)
# - Install an internet browser (6/13)
# - Install LibreOffice (7/13)
# - Install GIMP + Inkscape (8/13)
# - Install QEMU + Virt Manager (9/13)
# - Install a Terminal emulator (10/13)
# - Install a Backup program (11/13)
# - Install a Video player (12/13)
# - Enable required services (13/13)
# - Configure Cron
# - Configure Audio
# - Configure Network Manager
# - Configure Bluetooth
# - Configure Printing support
# - Configure TLP for notebook power saving
# - Configure the Display manager
#

# Color definitions

BLUE='\033[01;34m'
GREEN='\033[01;32m'
RED='\033[01;31m'
NONE='\033[00m'

# Update the System

printf "\n${BLUE}Checking for updates...${NONE}/n"

sudo xbps-install -Su
printf "\n${GREEN}Done${NONE}/n"

# Install recommended packages

printf "${BLUE}Install recommended packages...${NONE}/n"

sudo xbps-install curl wget unzip zip nano vim gptfdisk mtools mlocate \
	ntfs-3g fuse-exfat bash-completion linux-headers

printf "\n${GREEN}Done${NONE}/n"

# Install development packages

read -p 'Do you want to install development tools? (y/N) ' devtools
case $devtools in
	y )

	sudo xbps-install autoconf automake bison m4 make libtool flex meson ninja \
			optipng sassc

	printf "\n${GREEN}Done${NONE}/n"

	;;

	n )

	;;
esac

# Install shell

printf "\n${BLUE}Install shell...${NONE}/n"
printf "Possible (type in number): \n
- 1 Fish
- 2 Zsh
- 0 None/n"

read -p 'Which shell do you want?' shell
case $shell in
	1 )
	
	printf "\n${BLUE}Install Fish...${NONE}/n"
	
	sudo xbps-install fish-shell
	sudo usermod --shell /bin/fish "$USER"
	
	;;
	
	2 )
	
	printf "\n${BLUE}Install Zsh...${NONE}/n"
	
	sudo xbps-install zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting
	sudo usermod --shell /bin/zsh "$USER"
	
	;;
esac

# Install the X Window System

read -p 'Do you want to use a graphical environment? (y/N) ' xwinsys
case $xwinsys in
	y )

	printf "\n${BLUE}Install the X Window System...${NONE}/n"

	sudo xbps-install xorg-server xorg-server-xwayland xorg-video-drivers xorg-input-drivers \
		xinit xauth xrandr xrdb xwininfo xdpyinfo xsetroot neofetch

	printf "\n${BLUE}Copy configurations...${NONE}/n"

	if [ ! -d /etc/X11/xorg.conf.d ]; then
		sudo mkdir -p /etc/X11/xorg.conf.d
	fi

	sudo cp -r 00-keyboard.conf /etc/X11/xorg.conf.d/
	sudo cp -r 20-libinput.conf /etc/X11/xorg.conf.d/

	printf "\n${GREEN}Done${NONE}/n"

	# Install a Desktop environment

	printf "\n${BLUE}Install a Desktop environment...${NONE}/n"
	printf "Possible (type in number): \n
	- 1 Xfce
	- 2 MATE
	- 3 GNOME
	- 4 KDE Plasma
	- 5 Budgie
	- 6 Cinnamon
	- 7 LXQt
	- 8 Enlightenment
	- 9 LXDE
	- 10 Lumina
	- 0 none/n"

	read -p 'Which Desktop environment do you want? ' desktop
	case $desktop in
		1 ) 

		printf "\n${BLUE}Install Xfce...${NONE}/n"

		sudo xbps-install xfce4-appfinder xfce4-battery-plugin xfce4-clipman-plugin xfce4-cpufreq-plugin \
			xfce4-cpugraph-plugin xfce4-dict xfce4-diskperf-plugin xfce4-fsguard-plugin \
			xfce4-genmon-plugin xfce4-mailwatch-plugin xfce4-mpc-plugin xfce4-netload-plugin \
			xfce4-notifyd xfce4-panel xfce4-panel-appmenu xfce4-places-plugin xfce4-power-manager \
			xfce4-pulseaudio-plugin xfce4-screensaver xfce4-screenshooter xfce4-sensors-plugin \
			xfce4-session xfce4-settings xfce4-systemload-plugin xfce4-taskmanager xfce4-terminal \
			xfce4-timer-plugin xfce4-verve-plugin xfce4-whiskermenu-plugin xfce4-xkb-plugin \
			Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin ristretto \
			xarchiver mousepad xfwm4 xfdesktop zathura zathura-pdf-poppler gvfs gvfs-mtp gvfs-gphoto2 \
			xfce-polkit parole

		printf "\n${GREEN}Done${NONE}/n"
			
		;;
		
		2 ) 

		printf "\n${BLUE}Install MATE...${NONE}/n"

		sudo xbps-install mate-applets mate-backgrounds mate-calc mate-control-center mate-desktop \
			mate-icon-theme mate-indicator-applet mate-media mate-menus mate-notification-daemon \
			mate-panel mate-panel-appmenu mate-screensaver mate-sensors-applet mate-session-manager \
			mate-settings-daemon mate-system-monitor mate-terminal mate-themes mate-tweak mate-utils \
			mozo pluma caja caja-image-converter caja-sendto caja-open-terminal caja-wallpaper \
			caja-xattr-tags eom atril gvfs gvfs-mtp gvfs-gphoto2 engrampa mate-power-manager mate-polkit
		
		printf "\n${GREEN}Done${NONE}/n"
			
		;;
		
		3 )

		printf "\n${BLUE}Install GNOME...${NONE}/n"

		sudo xbps-install gnome-shell gnome-control-center gnome-tweaks gnome-system-monitor gnome-terminal gdm \
			gnome-disk-utility nautilus nautilus-sendto gvfs gvfs-mtp gvfs-gphoto2 eog eog-plugins \
			evince gedit gedit-plugins gnome-video-effects gnome-themes-extra gnome-session gnome-screenshot \
			gnome-shell-extensions gnome-icon-theme gnome-icon-theme-extras gnome-icon-theme-symbolic \
			gnome-backgrounds file-roller chrome-gnome-shell totem
					
		printf "\n${BLUE}GNOME Applications${NONE}/n"
		printf "Includes: GNOME Calendar, GNOME Clocks, GNOME Weather, Evolution, GNOME Font Viewer,"
		printf "GNOME Calculator, GNOME Characters, GNOME Contacts, GNOME Documents, GNOME Maps/n"

		read -p 'Do you want to install GNOME applications? (y/N) ' gnomeapps
		case $gnomeapps in
			y )

			printf "\n${BLUE}Install GNOME applications...${NONE}/n"

			sudo xbps-install gnome-calendar gnome-clocks gnome-weather evolution gnome-font-viewer \
				gnome-calculator gnome-characters gnome-contacts gnome-documents gnome-maps

			;;
		
			n )

			;;
		esac
		
		printf "\n${GREEN}Done${NONE}/n"

		;;
		
		4 )

		printf "\n${BLUE}Install KDE Plasma...${NONE}/n"

		sudo xbps-install plasma-desktop plasma-disks plasma-thunderbolt plasma-systemmonitor plasma-pa plasma-nm \
			plasma-firewall plasma-browser-integration plasma-vault latte-dock oxygen kdegraphics-thumbnailers \
			dolphin dolphin-plugins kate5 konsole okular gwenview ark sddm sddm-kcm yakuake spectacle \
			partitionmanager ffmpegthumbs kde-gtk-config5

		printf "\n${BLUE}KDE Applications${NONE}/n"
		printf "Includes: KMail, Kontact, KOrganizer, KAddressbook, Akregator, Konversation, KCalc, KCharSelect/n"

		read -p 'Do you want to install KDE applications? (y/N) ' kdeapps
		case $kdeapps in
			y )

			printf "\n${BLUE}Install KDE applications...${NONE}/n"

			sudo xbps-install kmail kontact korganizer kaddressbook akregator konversation kcalc kcharselect

			;;

			n )

			;;
		esac

		read -p 'Do you want to use KDE Connect? (y/N) ' kdeconnect
		case $kdeconnect in
			y )

			printf "\n${BLUE}Install KDE Connect...${NONE}/n"

			sudo xbps-install kdeconnect

			;;

			n )

			;;
		esac

		printf "\n${GREEN}Done${NONE}/n"

		;;

		5 )

		printf "\n${BLUE}Install Budgie...${NONE}/n"

		sudo xbps-install budgie-desktop gnome-control-center gnome-system-monitor gnome-terminal nautilus \
			nautilus-sendto gnome-keyring evince gedit gedit-plugins eog eog-plugins gnome-screenshot \
			gnome-disk-utility gvfs gvfs-mtp gvfs-gphoto2 file-roller

		printf "\n${GREEN}Done${NONE}/n"

		;;

		6 )

		printf "\n${BLUE}Install Cinnamon...${NONE}/n"

		sudo xbps-install cinnamon gnome-system-monitor gnome-terminal gnome-screenshot gnome-disk-utility \
			gnome-keyring gedit gedit-plugins evince gvfs gvfs-mtp gvfs-gphoto2 eog eog-plugins file-roller
		
		printf "\n${GREEN}Done${NONE}/n"

		;;

		7 )

		printf "\n${BLUE}Install LXQt...${NONE}/n"

		sudo xbps-install lxqt-about lxqt-admin lxqt-archiver lxqt-build-tools lxqt-config lxqt-globalkeys lxqt-notificationd \
			lxqt-openssh-askpass lxqt-panel lxqt-policykit lxqt-powermanagement lxqt-qtplugin lxqt-runner lxqt-session \
			lxqt-sudo lxqt-themes obconf-qt openbox pcmanfm-qt lximage-qt FeatherPad qlipper qterminal

		printf "\n${GREEN}Done${NONE}/n"

		;;

		8 )

		printf "\n${BLUE}Install Enlightenment...${NONE}/n"

		sudo xbps-install enlightenment terminology mousepad gvfs gvfs-mtp gvfs-gphoto2 zathura zathura-pdf-poppler \
			Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin xarchiver

		printf "\n${GREEN}Done${NONE}/n"

		;;

		9 )

		printf "\n${BLUE}Install LXDE...${NONE}/n"

		sudo xbps-install lxde-common lxde-icon-theme lxappearance lxinput lxpanel lxrandr lxsession lxtask \
			lxterminal pcmanfm gvfs gvfs-mtp gvfs-gphoto2 viewnior mousepad zathura zathura-pdf-poppler \
			openbox obconf lxappearance-obconf xarchiver

		printf "\n${GREEN}Done${NONE}/n"

		;;

		10 )

		printf "\n${BLUE}Install Lumina...${NONE}/n"

		sudo xbps-install lumina lumina-pdf lumina-calculator gvfs gvfs-mtp gvfs-gphoto2 mousepad lxterminal viewnior

		printf "\n${GREEN}Done${NONE}/n"

		;;
		
		0 ) 
			
		;;
	esac

	# Install display manager
	
	printf "\n${BLUE}Install a display manageer...${NONE}/n"
	printf "Possible (type in number): \n
	- 1 Lightdm
	- 2 Emptty
	- 3 Slim
	- 0 none/n"
	
	read -p 'Which display manager do you want? ' displaymanager
	case $displaymanager in
		1 )
		
		printf "\n${BLUE}Install Lightdm...${NONE}/n"		
		
		sudo xbps-install lightdm lightdm-gtk3-greeter lightdm-gtk-greeter-settings
		
		printf "\n${GREEN}Done${NONE}/n"
			
		;;
		
		2 )

		printf "\n${BLUE}Install Emptty...${NONE}/n"		

		sudo xbps-install emptty

		printf "\n${GREEN}Done${NONE}/n"
					
		;;

		3 )

		printf "\n${BLUE}Install Slim...${NONE}/n"		

		sudo xbps-install slim

		printf "\n${GREEN}Done${NONE}/n"
					
		;;
		
		0 ) 
			
		;;
	esac

	# Install a Window manager
	
	printf "\n${BLUE}Install a Window Manager...${NONE}/n"
	printf "Possible (type in number): \n
	--- Xorg ---
	- 1 i3-gaps
	- 2 Openbox
	- 3 Fluxbox
	- 4 bspwm
	- 5 herbstluftwm
	- 6 IceWM
	- 7 awesome
	- 8 jwm
	- 9 dwm
	- 10 FVWM3
	--- Wayland ---
	- 11 Sway
	- 12 Wayfire
	- 0 none/n"

	read -p 'Which Window manager do you want? ' windowmanager
	case $windowmanager in
		1 ) 

		printf "\n${BLUE}Install i3-gaps...${NONE}/n"

		sudo xbps-install i3-gaps i3lock i3status i3blocks dunst dmenu feh Thunar \
			thunar-volman thunar-archive-plugin thunar-media-tags-plugin xarchiver \
			lm_sensors acpi playerctl scrot htop xfce4-terminal arandr gvfs gvfs-mtp \
			gvfs-gphoto2 mousepad xfce4-taskmanager viewnior

		printf "\n${GREEN}Done${NONE}/n"
			
		;;

		2 )

		printf "\n${BLUE}Install Openbox...${NONE}/n"

		sudo xbps-install openbox obconf lxappearance lxappearance-obconf jgmenu dunst \
			feh lxterminal lxrandr lxinput pcmanfm gvfs gvfs-mtp gvfs-gphoto2 \
			mousepad lxtask scrot htop xarchiver viewnior

		printf "\n${GREEN}Done${NONE}/n"

		;;
		
		3 )

		printf "\n${BLUE}Install Fluxbox...${NONE}/n"

		sudo xbps-install fluxbox dunst feh xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad xfce4-terminal scrot htop xarchiver \
		        viewnior

		printf "\n${GREEN}Done${NONE}/n"

		;;

		4 )

		printf "\n${BLUE}Install Bspwm...${NONE}/n"

		sudo xbps-install bspwm sxhkd dunst feh dmenu xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver viewnior

		printf "\n${GREEN}Done${NONE}/n"

		;;

		5 )

		printf "\n${BLUE}Install herbstluftwm...${NONE}/n"

		sudo xbps-install herbstluftwm dunst feh dmenu xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver viewnior

		printf "\n${GREEN}Done${NONE}/n"

		;;

		6 )

		printf "\n${BLUE}Install IceWM...${NONE}/n"

		sudo xbps-install icewm dunst feh dmenu xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver viewnior

		printf "\n${GREEN}Done${NONE}/n"

		;;

		7 )

		printf "\n${BLUE}Install awesome...${NONE}/n"

		sudo xbps-install awesome vicious dunst feh arandr xfce4-terminal Thunar thunar-volman \
				thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot \
				htop xarchiver viewnior

		printf "\n${GREEN}Done${NONE}/n"

		;;

		8 )

		printf "\n${BLUE}Install jwm...${NONE}/n"

		sudo xbps-install jwm dunst feh dmenu xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver viewnior

		printf "\n${GREEN}Done${NONE}/n"

		;;

		9 )

		printf "\n${BLUE}Install dwm...${NONE}/n"

		sudo xbps-install dwm dunst feh dmenu xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver viewnior

		printf "\n${GREEN}Done${NONE}/n"

		;;

		10 )

		printf "\n${BLUE}Install FVWM3...${NONE}/n"

		sudo xbps-install fvwm3 feh xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver viewnior

		printf "\n${GREEN}Done${NONE}/n"

		;;
		
		11 )

		printf "\n${BLUE}Install Sway...${NONE}/n"

		sudo xbps-install sway swaybg swayidle swaylock azote grimshot Waybar gvfs gvfs-mtp gvfs-gphoto2 \
				htop wofi

		printf "\n${GREEN}Done${NONE}/n"

		;;

		12 )

		printf "\n${BLUE}Install Wayfire...${NONE}/n"

		sudo xbps-install wayfire grim gvfs gvfs-mtp gvfs-gphoto2 htop wofi

		printf "\n${GREEN}Done${NONE}/n"

		;;

		0 ) 
			
		;;
	esac

	# Install fonts

	read -p 'Do you want to install some fonts? (y/N) ' fonts
	case $fonts in
		y ) 

		printf "\n${BLUE}Install fonts...${NONE}/n"

		sudo xbps-install liberation-fonts-ttf dejavu-fonts-ttf \
			ttf-ubuntu-font-family fonts-roboto-ttf

		printf "\n${GREEN}Done${NONE}/n"
			
		;;
		
		n ) 
			
		;;
	esac

	# Install an Internet browser

	printf "\n${BLUE}Install an Internet browser...${NONE}/n"
	printf "Possible (type in number): \n
	- 1 Firefox
	- 2 Firefox-ESR
	- 3 Chromium
	- 4 qutebrowser
	- 5 Falkon
	- 6 Badwolf
	- 0 None/n"

	read -p 'Which browser do you want? ' browser
	case $browser in
		1 )

		printf "\n${BLUE}Install Firefox...${NONE}/n"

		sudo xbps-install firefox firefox-i18n-en-US firefox-i18n-de

		printf "\n${GREEN}Done${NONE}/n"
			
		;;

		2 ) 

		printf "\n${BLUE}Install Firefox Extended Support Release...${NONE}/n"

		sudo xbps-install firefox-esr firefox-esr-i18n-en-US firefox-esr-i18n-de

		printf "\n${GREEN}Done${NONE}/n"
			
		;;

		3 ) 

		printf "\n${BLUE}Install Chromium...${NONE}/n"

		sudo xbps-install chromium

		printf "\n${GREEN}Done${NONE}/n"
			
		;;

		4 )

		printf "\n${BLUE}Install qutebrowser...${NONE}/n"

		sudo xbps-install qutebrowser

		printf "\n${GREEN}Done${NONE}/n"

		;;

		5 )

		printf "\n${BLUE}Install Falkon...${NONE}/n"

		sudo xbps-install falkon

		printf "\n${GREEN}Done${NONE}/n"

		;;
		
		0 ) 
			
		;;
		
		6 )
		
		printf "\n${BLUE}Install Badwolf...${NONE}/n"

		sudo xbps-install badwolf

		printf "\n${GREEN}Done${NONE}/n"

		;;
		
	esac

	# Install LibreOffice

	read -p 'Do you want to install LibreOffice? (y/N) ' libreoffice
	case $libreoffice in
		y )

		printf "\n${BLUE}Install LibreOffice...${NONE}/n"

		sudo xbps-install libreoffice-writer libreoffice-calc libreoffice-impress \
			libreoffice-draw libreoffice-math libreoffice-base libreoffice-gnome \
			libreoffice-i18n-en-US libreoffice-i18n-de

		printf "\n${GREEN}Done${NONE}/n"

		;;

		n )

		;;
	esac

	# Install GIMP + Inkscape

	read -p 'Do you want to install GIMP and Inkscape? (y/N) ' gimpinkscape
	case $gimpinkscape in
		y )

		printf "\n${BLUE}Install GIMP and Inkscape...${NONE}/n"

		sudo xbps-install inkscape gimp

		printf "\n${GREEN}Done${NONE}/n"

		;;

		n )

		;;
	esac

	# Install QEMU + Virt Manager

	read -p 'Do you want to install QEMU and Virt Manager? (y/N) ' qemuvirt
	case $qemuvirt in
		y )

		printf "\n${BLUE}Install QEMU and Virt Manager...${NONE}/n"

		sudo xbps-install qemu virt-manager libvirt

		printf "\n${BLUE}Enable libvirtd service...${NONE}/n"

		if [ -L /var/service/libvirtd ]; then
			printf "\nService ${GREEN}libvirtd ${NONE}already exist. Continue./n"
		else
			sudo ln -sv /etc/sv/libvirtd /var/service
			printf "\n${GREEN}Done${NONE}/n"
		fi

		;;

		n )

		;;
	esac

	# Install a Terminal emulator

	printf "\n${BLUE}Install a Terminal emulator...${NONE}/n"
	printf "Possible (type in number): \n
	- 1 Alacritty
	- 2 xterm
	- 3 LXTerminal
	- 4 Yakuake
	- 5 Sakura
	- 6 Kitty
	- 0 I take the given one/n"

	read -p 'What terminal emulator do you want? ' terminal
	case $terminal in
		1 ) 

		printf "\n${BLUE}Install Alacritty...${NONE}/n"

		sudo xbps-install alacritty alacritty-terminfo
		export TERMINAL='alacritty'
		printf TERM='alacritty' > ~/.bashrc
	
		printf "\n${GREEN}Done${NONE}/n"
			
		;;
		
		2 ) 

		printf "\n${BLUE}Install xterm...${NONE}/n"

		sudo xbps-install xterm
		export TERMINAL='xterm'
		printf TERM='xterm' > ~/.bashrc

		printf "\n${GREEN}Done${NONE}/n"
			
		;;
		
		3 ) 
		
		printf "\n${BLUE}Install LXTerminal...${NONE}/n"

		sudo xbps-install lxterminal
		export TERMINAL='lxterminal'
		printf TERM='lxterminal' > ~/.bashrc
		
		printf "\n${GREEN}Done${NONE}/n"
			
		;;

		4 )
		
		printf "\n${BLUE}Install Yakuake...${NONE}/n"

		sudo xbps-install yakuake
		export TERMINAL='yakuake'
		printf TERM='yakuake' > ~/.bashrc
		
		printf "\n${GREEN}Done${NONE}/n"

		;;

		5 )
		
		printf "\n${BLUE}Install Sakura...${NONE}/n"

		sudo xbps-install sakura
		export TERMINAL='sakura'
		printf TERM='sakura' > ~/.bashrc
		
		printf "\n${GREEN}Done${NONE}/n"

		;;

		0 )
		
		printf "\n${BLUE}Install Kitty...${NONE}/n"

		sudo xbps-install kitty kitty-terminfo
		export TERMINAL='kitty'
		printf TERM='kitty' > ~/.bashrc
		
		printf "\n${GREEN}Done${NONE}/n"

		;;
	esac

	# Install a Backup program

	printf "\n${BLUE}Install a Backup program...${NONE}/n"
	printf "Possible (type in number): \n
	- 1 Borg
	- 2 Timeshift
	- 3 Deja-dup
	- 0 none/n"

	read -p 'Which Backup program do you want? ' backup
	case $backup in
			1 )

			printf "\n${BLUE}Install Borg...${NONE}/n"

			sudo xbps-install borg

			printf "\n${GREEN}Done${NONE}/n"

			;;

			2 )
			
			printf "\n${BLUE}Install Timeshift...${NONE}/n"

			sudo xbps-install timeshift

			printf "\n${GREEN}Done${NONE}/n"

			;;

			3 )
			
			printf "\n${BLUE}Install Deja-dup...${NONE}/n"

			sudo xbps-install deja-dup

			printf "\n${GREEN}Done${NONE}/n"

			;;

			0 )

			;;
	esac

	# Install a Video player

	printf "\n${BLUE}Install a Video player...${NONE}/n"
	printf "Possible (type in number): \n
	- 1 mpv
	- 2 VLC Media Player
	- 3 Parole (part of Xfce)
	- 4 Totem (part of GNOME)
	- 0 none/n"

	read -p 'Which Video player do you want? ' videoplayer
	case $videoplayer in
			1 )
			
			printf "\n${BLUE}Install mpv...${NONE}/n"

			sudo xbps-install mpv

			printf "\n${GREEN}Done${NONE}/n"

			;;

			2 )
			
			printf "\n${BLUE}Install VLC Media Player...${NONE}/n"

			sudo xbps-install vlc

			printf "\n${GREEN}Done${NONE}/n"

			;;

			3 )
			
			printf "\n${BLUE}Install Parole...${NONE}/n"

			sudo xbps-install parole

			printf "\n${GREEN}Done${NONE}/n"

			;;

			4 )
			
			printf "\n${BLUE}Install Totem...${NONE}/n"

			sudo xbps-install totem

			printf "\n${GREEN}Done${NONE}/n"

			;;

			0 )

			;;
	esac

	# Enable required services

	printf "\n${BLUE}Enable required services...${NONE}/n"

	printf "\n${BLUE}Enable D-Bus...${NONE}/n"

	sudo xbps-install -y dbus

	if [ -L /var/service/dbus ]; then
		printf "\nService ${GREEN}dbus ${NONE}already exist. Continue./n"
	else
		sudo ln -s /etc/sv/dbus /var/service
		printf "\n${GREEN}Done${NONE}/n"
	fi

	printf "\n${BLUE}Enable elogind...${NONE}/n"

	sudo xbps-install -y elogind

	if [ -L /var/service/elogind ]; then
		printf "\nService ${GREEN}elogind ${NONE}already exist. Continue./n"
	else
		sudo ln -s /etc/sv/elogind /var/service
		printf "\n${GREEN}Done${NONE}/n"
	fi

	printf "\n${BLUE}Enable Polkit...${NONE}/n"

	if [ -L /var/service/polkitd ]; then
		printf "\nService ${GREEN}polkitd ${NONE}already exist. Continue./n"
	else
		sudo ln -s /etc/sv/polkitd /var/service
		printf "\n${GREEN}Done${NONE}/n"
	fi

	;;

	n )

	;;
esac

# Configure Cron

printf "\n${BLUE}Configure Cron...${NONE}/n"
printf "\nInstall cronie.../n"

sudo xbps-install -y cronie

printf "\n${BLUE}Enable cronie service...${NONE}/n"

if [ -L /var/service/cronie ]; then
	printf "\nService ${GREEN}cronie ${NONE}already exist. Continue./n"
else
	sudo ln -sv /etc/sv/cronie /var/service
	printf "\n${GREEN}Done${NONE}/n"
fi

# Configure Audio

read -p 'Do you want to install PulseAudio for audio? (y/N) ' pulseaudio
case $pulseaudio in
	y )

	printf "\n${BLUE}Install PulseAudio...${NONE}/n"

	sudo xbps-install pulseaudio pulseaudio-utils pulsemixer alsa-plugins-pulseaudio \
		pavucontrol

	printf "\n${GREEN}Done${NONE}/n"

	;;

	n )

	;;
esac

# Configure Network Management

printf "\n${BLUE}Configure Network Management...${NONE}/n"
printf "\nPossible (type in number): \n
- 1 Network Manager
- 2 Connman
- 0 None/n"

read -p 'Which Network Management tool do you want to use? ' netmngt
case $netmngt in
	1 )

	printf "\n${BLUE}Install Network Manager...${NONE}/n"

	sudo xbps-install NetworkManager NetworkManager-openvpn NetworkManager-openconnect \
			NetworkManager-vpnc NetworkManager-l2tp
	
	printf "/n"

	read -p 'Do you want to integrate Network Manager into a graphical environment? (y/N) ' nmapplet
	case $nmapplet in
			y ) 

			printf "\n${BLUE}Install Network Manager applet...${NONE}/n"

			sudo xbps-install network-manager-applet
					
			;;

			n )

			;;
	esac

	printf "\n${BLUE}Enable Network Manager service...${NONE}/n"

	if [ -L /var/service/NetworkManager ]; then
		printf "\nService ${GREEN}NetworkManager ${NONE}already exist. Continue./n"
	else
		sudo ln -sv /etc/sv/NetworkManager /var/service
		printf "\n${GREEN}Done${NONE}/n"
	fi

	;;

	2 )

	printf "\n${BLUE}Install Connman...${NONE}/n"

	sudo xbps-install connman connman-ncurses

	printf "\n${BLUE}Enable Connman service...${NONE}/n"

	if [ -L /var/service/connmand ]; then
		printf "\nService ${GREEN}connmand ${NONE}already exist. Continue./n"
	else
		sudo ln -sv /etc/sv/connmand /var/service
		printf "\n${GREEN}Done${NONE}/n"
	fi

	;;

	0 )

	;;
esac

# Configure Bluetooth

read -p 'Do you want to use Bluetooth? (y/N) ' bluetooth
case $bluetooth in
	y )

	printf "\n${BLUE}Install BlueZ...${NONE}/n"

	sudo xbps-install bluez

	printf "/n"

	read -p 'Do you want to integrate Bluetooth into a graphical environment? (y/N) ' blueman
	case $blueman in
			y )

			printf "\n${BLUE}Install Blueman...${NONE}/n"

			sudo xbps-install blueman

			;;

			n )

			;;
	esac

	printf "\n${BLUE}Enable Bluetooth service...${NONE}/n"

	if [ -L /var/service/bluetoothd ]; then
		printf "\nService ${GREEN}bluetoothd ${NONE}already exist. Continue./n"
	else
		sudo ln -sv /etc/sv/bluetoothd /var/service
		printf "\n${GREEN}Done${NONE}/n"
	fi

	;;

	n )

	;;
esac

# Configure Printing support

read -p 'Do you want to use printers? (y/N) ' printer
case $printer in
	y )

	printf "\n${BLUE}Install CUPS and Tools...${NONE}/n"

	sudo xbps-install cups cups-pk-helper cups-filters foomatic-db foomatic-db-engine

	printf "/n"

	read -p 'Do you want to install a graphical printer program? (y/N) ' printergui
	case $printergui in
			y )

			printf "\n${BLUE}Install system-config-printer...${NONE}/n"

			sudo xbps-install system-config-printer

			;;

			n )

			;;
	esac

	printf "\n${BLUE}Enable CUPS service...${NONE}/n"

	if [ -L /var/service/cupsd ]; then
		printf "\nService ${GREEN}cupsd ${NONE}already exist. Continue./n"
	else
		sudo ln -sv /etc/sv/cupsd /var/service
		printf "\n${GREEN}Done${NONE}/n"
	fi

	;;

	n )

	;;
esac

# Configure Notebook Power Saving

read -p 'Do you want to install TLP for power saving (Notebooks only)? (y/N) ' nb_power
case $nb_power in
	y )

	printf "\n${BLUE}Install TLP and PowerTop...${NONE}/n"

	sudo xbps-install tlp tlp-rdw powertop

	printf "\n${BLUE}Enable TLP service...${NONE}/n"

	if [ -L /var/service/tlp ]; then
		printf "\nService ${GREEN}tlp ${NONE}already exist. Continue./n"
	else
		sudo ln -sv /etc/sv/tlp /var/service
		printf "\n${GREEN}Done${NONE}/n"
	fi

	;;

	n )

	;;
esac

# Configure the Display manager

read -p 'sudo if a display manager exist. If yes, enable it? (y/N) ' dmenable
case $dmenable in
	y )

	if [ -f /usr/bin/lightdm ]; then
		sudo ln -sv /etc/sv/lightdm /var/service
	elif [ -f /usr/bin/sddm ]; then
		sudo ln -sv /etc/sv/sddm /var/service
	elif [ -f /usr/bin/gdm ]; then
		sudo ln -sv /etc/sv/gdm /var/service
	elif [ -f /usr/bin/slim ]; then
		sudo ln -sv /etc/sv/slim /var/service
	elif [ -f /usr/bin/emptty ]; then
		sudo ln -sv /etc/sv/emptty /var/service
	fi

	;;

	n )

	;;
esac

printf "\n${BLUE}Finished.${NONE}/n"
