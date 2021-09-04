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
INSTALL='sudo xbps-install'

check () {
  if [[ $EUID -gt 0 ]]; then
    echo -e "\n${RED}as ROOT..${NONE}\n"
    SUDO=sudo
  else
    SUDO=''
  fi
}

# Update the System


echo -e "\n${BLUE}Checking for updates...${NONE}\n"

$INSTALL -Su

echo -e "\n${GREEN}Done${NONE}\n"

# Install recommended packages

echo -e "${BLUE}Install recommended packages...${NONE}\n"

$INSTALL curl wget unzip zip nano vim gptfdisk mtools mlocate \
	ntfs-3g fuse-exfat bash-completion linux-headers

echo -e "\n${GREEN}Done${NONE}\n"

# Install development packages

read -p "Do you want to install development tools? (y/N) " devtools
case $devtools in
	y )

	$INSTALL autoconf automake bison m4 make libtool flex meson ninja \
			optipng sassc

	echo -e "\n${GREEN}Done${NONE}\n"

	;;

	n )

	;;
esac

# Install shell

echo -e "\n${BLUE}Install shell...${NONE}\n"
echo -e "Possible (type in number): \n
- 1 Fish
- 2 Zsh
- 0 None\n"

read -p "Which shell do you want?" shell
case $shell in
	1 )
	
	echo -e "\n${BLUE}Install Fish...${NONE}\n"
	
	$INSTALL fish-shell
	check usermod --shell /bin/fish $USER
	
	;;
	
	2 )
	
	echo -e "\n${BLUE}Install Zsh...${NONE}\n"
	
	$INSTALL zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting
	check usermod --shell /bin/zsh $USER
	
	;;
esac

# Install the X Window System

read -p "Do you want to use a graphical environment? (y/N) " xwinsys
case $xwinsys in
	y )

	echo -e "\n${BLUE}Install the X Window System...${NONE}\n"

	INSTALL xorg-server xorg-server-xwayland xorg-video-drivers xorg-input-drivers \
		xinit xauth xrandr xrdb xwininfo xdpyinfo xsetroot neofetch

	echo -e "\n${BLUE}Copy configurations...${NONE}\n"

	if [ ! -d /etc/X11/xorg.conf.d ]; then
		check mkdir -p /etc/X11/xorg.conf.d
	fi

	check cp -r 00-keyboard.conf /etc/X11/xorg.conf.d/
	check cp -r 20-libinput.conf /etc/X11/xorg.conf.d/

	echo -e "\n${GREEN}Done${NONE}\n"

	# Install a Desktop environment

	echo -e "\n${BLUE}Install a Desktop environment...${NONE}\n"
	echo -e "Possible (type in number): \n
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
	- 0 none\n"

	read -p "Which Desktop environment do you want? " desktop
	case $desktop in
		1 ) 

		echo -e "\n${BLUE}Install Xfce...${NONE}\n"

		INSTALL xfce4-appfinder xfce4-battery-plugin xfce4-clipman-plugin xfce4-cpufreq-plugin \
			xfce4-cpugraph-plugin xfce4-dict xfce4-diskperf-plugin xfce4-fsguard-plugin \
			xfce4-genmon-plugin xfce4-mailwatch-plugin xfce4-mpc-plugin xfce4-netload-plugin \
			xfce4-notifyd xfce4-panel xfce4-panel-appmenu xfce4-places-plugin xfce4-power-manager \
			xfce4-pulseaudio-plugin xfce4-screensaver xfce4-screenshooter xfce4-sensors-plugin \
			xfce4-session xfce4-settings xfce4-systemload-plugin xfce4-taskmanager xfce4-terminal \
			xfce4-timer-plugin xfce4-verve-plugin xfce4-whiskermenu-plugin xfce4-xkb-plugin \
			Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin ristretto \
			xarchiver mousepad xfwm4 xfdesktop zathura zathura-pdf-poppler gvfs gvfs-mtp gvfs-gphoto2 \
			xfce-polkit parole

		echo -e "\n${GREEN}Done${NONE}\n"
			
		;;
		
		2 ) 

		echo -e "\n${BLUE}Install MATE...${NONE}\n"

		INSTALL mate-applets mate-backgrounds mate-calc mate-control-center mate-desktop \
			mate-icon-theme mate-indicator-applet mate-media mate-menus mate-notification-daemon \
			mate-panel mate-panel-appmenu mate-screensaver mate-sensors-applet mate-session-manager \
			mate-settings-daemon mate-system-monitor mate-terminal mate-themes mate-tweak mate-utils \
			mozo pluma caja caja-image-converter caja-sendto caja-open-terminal caja-wallpaper \
			caja-xattr-tags eom atril gvfs gvfs-mtp gvfs-gphoto2 engrampa mate-power-manager mate-polkit
		
		echo -e "\n${GREEN}Done${NONE}\n"
			
		;;
		
		3 )

		echo -e "\n${BLUE}Install GNOME...${NONE}\n"

		INSTALL gnome-shell gnome-control-center gnome-tweaks gnome-system-monitor gnome-terminal gdm \
			gnome-disk-utility nautilus nautilus-sendto gvfs gvfs-mtp gvfs-gphoto2 eog eog-plugins \
			evince gedit gedit-plugins gnome-video-effects gnome-themes-extra gnome-session gnome-screenshot \
			gnome-shell-extensions gnome-icon-theme gnome-icon-theme-extras gnome-icon-theme-symbolic \
			gnome-backgrounds file-roller chrome-gnome-shell totem
					
		echo -e "\n${BLUE}GNOME Applications${NONE}\n"
		echo -e "Includes: GNOME Calendar, GNOME Clocks, GNOME Weather, Evolution, GNOME Font Viewer,"
		echo -e "GNOME Calculator, GNOME Characters, GNOME Contacts, GNOME Documents, GNOME Maps\n"

		read -p "Do you want to install GNOME applications? (y/N) " gnomeapps
		case $gnomeapps in
			y )

			echo -e "\n${BLUE}Install GNOME applications...${NONE}\n"

			INSTALL gnome-calendar gnome-clocks gnome-weather evolution gnome-font-viewer \
				gnome-calculator gnome-characters gnome-contacts gnome-documents gnome-maps

			;;
		
			n )

			;;
		esac
		
		echo -e "\n${GREEN}Done${NONE}\n"

		;;
		
		4 )

		echo -e "\n${BLUE}Install KDE Plasma...${NONE}\n"

		INSTALL plasma-desktop plasma-disks plasma-thunderbolt plasma-systemmonitor plasma-pa plasma-nm \
			plasma-firewall plasma-browser-integration plasma-vault latte-dock oxygen kdegraphics-thumbnailers \
			dolphin dolphin-plugins kate5 konsole okular gwenview ark sddm sddm-kcm yakuake spectacle \
			partitionmanager ffmpegthumbs kde-gtk-config5

		echo -e "\n${BLUE}KDE Applications${NONE}\n"
		echo -e "Includes: KMail, Kontact, KOrganizer, KAddressbook, Akregator, Konversation, KCalc, KCharSelect\n"

		read -p "Do you want to install KDE applications? (y/N) " kdeapps
		case $kdeapps in
			y )

			echo -e "\n${BLUE}Install KDE applications...${NONE}\n"

			INSTALL kmail kontact korganizer kaddressbook akregator konversation kcalc kcharselect

			;;

			n )

			;;
		esac

		read -p "Do you want to use KDE Connect? (y/N) " kdeconnect
		case $kdeconnect in
			y )

			echo -e "\n${BLUE}Install KDE Connect...${NONE}\n"

			INSTALL kdeconnect

			;;

			n )

			;;
		esac

		echo -e "\n${GREEN}Done${NONE}\n"

		;;

		5 )

		echo -e "\n${BLUE}Install Budgie...${NONE}\n"

		INSTALL budgie-desktop gnome-control-center gnome-system-monitor gnome-terminal nautilus \
			nautilus-sendto gnome-keyring evince gedit gedit-plugins eog eog-plugins gnome-screenshot \ 
			gnome-disk-utility gvfs gvfs-mtp gvfs-gphoto2 file-roller

		echo -e "\n${GREEN}Done${NONE}\n"

		;;

		6 )

		echo -e "\n${BLUE}Install Cinnamon...${NONE}\n"

		INSTALL cinnamon gnome-system-monitor gnome-terminal gnome-screenshot gnome-disk-utility \
			gnome-keyring gedit gedit-plugins evince gvfs gvfs-mtp gvfs-gphoto2 eog eog-plugins file-roller
		
		echo -e "\n${GREEN}Done${NONE}\n"

		;;

		7 )

		echo -e "\n${BLUE}Install LXQt...${NONE}\n"

		INSTALL lxqt-about lxqt-admin lxqt-archiver lxqt-build-tools lxqt-config lxqt-globalkeys lxqt-notificationd \
			lxqt-openssh-askpass lxqt-panel lxqt-policykit lxqt-powermanagement lxqt-qtplugin lxqt-runner lxqt-session \
			lxqt-sudo lxqt-themes obconf-qt openbox pcmanfm-qt lximage-qt FeatherPad qlipper qterminal

		echo -e "\n${GREEN}Done${NONE}\n"

		;;

		8 )

		echo -e "\n${BLUE}Install Enlightenment...${NONE}\n"

		INSTALL enlightenment terminology mousepad gvfs gvfs-mtp gvfs-gphoto2 zathura zathura-pdf-poppler \
			Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin xarchiver

		echo -e "\n${GREEN}Done${NONE}\n"

		;;

		9 )

		echo -e "\n${BLUE}Install LXDE...${NONE}\n"

		INSTALL lxde-common lxde-icon-theme lxappearance lxinput lxpanel lxrandr lxsession lxtask \
			lxterminal pcmanfm gvfs gvfs-mtp gvfs-gphoto2 viewnior mousepad zathura zathura-pdf-poppler \ 
			openbox obconf lxappearance-obconf xarchiver

		echo -e "\n${GREEN}Done${NONE}\n"

		;;

		10 )

		echo -e "\n${BLUE}Install Lumina...${NONE}\n"

		INSTALL lumina lumina-pdf lumina-calculator gvfs gvfs-mtp gvfs-gphoto2 mousepad lxterminal viewnior

		echo -e "\n${GREEN}Done${NONE}\n"

		;;
		
		0 ) 
			
		;;
	esac

	# Install display manager
	
	echo -e "\n${BLUE}Install a display manageer...${NONE}\n"
	echo -e "Possible (type in number): \n
	- 1 Lightdm
	- 2 Emptty
	- 3 Slim
	- 0 none\n"
	
	read -p "Which display manager do you want? " displaymanager
	case $displaymanager in
		1 )
		
		echo -e "\n${BLUE}Install Lightdm...${NONE}\n"		
		
		INSTALL lightdm lightdm-gtk3-greeter lightdm-gtk-greeter-settings
		
		echo -e "\n${GREEN}Done${NONE}\n"
			
		;;
		
		2 )

		echo -e "\n${BLUE}Install Emptty...${NONE}\n"		

		INSTALL emptty

		echo -e "\n${GREEN}Done${NONE}\n"
					
		;;

		3 )

		echo -e "\n${BLUE}Install Slim...${NONE}\n"		

		INSTALL slim

		echo -e "\n${GREEN}Done${NONE}\n"
					
		;;
		
		0 ) 
			
		;;
	esac

	# Install a Window manager
	
	echo -e "\n${BLUE}Install a Window Manager...${NONE}\n"
	echo -e "Possible (type in number): \n
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
	- 0 none\n"

	read -p "Which Window manager do you want? " windowmanager
	case $windowmanager in
		1 ) 

		echo -e "\n${BLUE}Install i3-gaps...${NONE}\n"

		INSTALL i3-gaps i3lock i3status i3blocks dunst dmenu feh Thunar \
			thunar-volman thunar-archive-plugin thunar-media-tags-plugin xarchiver \
			lm_sensors acpi playerctl scrot htop xfce4-terminal arandr gvfs gvfs-mtp \
			gvfs-gphoto2 mousepad xfce4-taskmanager viewnior

		echo -e "\n${GREEN}Done${NONE}\n"
			
		;;

		2 )

		echo -e "\n${BLUE}Install Openbox...${NONE}\n"

		INSTALL openbox obconf lxappearance lxappearance-obconf jgmenu dunst \
			feh lxterminal lxrandr lxinput pcmanfm gvfs gvfs-mtp gvfs-gphoto2 \
			mousepad lxtask scrot htop xarchiver viewnior

		echo -e "\n${GREEN}Done${NONE}\n"

		;;
		
		3 )

		echo -e "\n${BLUE}Install Fluxbox...${NONE}\n"

		INSTALL fluxbox dunst feh xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad xfce4-terminal scrot htop xarchiver \
		        viewnior

		echo -e "\n${GREEN}Done${NONE}\n"

		;;

		4 )

		echo -e "\n${BLUE}Install Bspwm...${NONE}\n"

		INSTALL bspwm sxhkd dunst feh dmenu xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver viewnior

		echo -e "\n${GREEN}Done${NONE}\n"

		;;

		5 )

		echo -e "\n${BLUE}Install herbstluftwm...${NONE}\n"

		INSTALL herbstluftwm dunst feh dmenu xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver viewnior

		echo -e "\n${GREEN}Done${NONE}\n"

		;;

		6 )

		echo -e "\n${BLUE}Install IceWM...${NONE}\n"

		INSTALL icewm dunst feh dmenu xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver viewnior

		echo -e "\n${GREEN}Done${NONE}\n"

		;;

		7 )

		echo -e "\n${BLUE}Install awesome...${NONE}\n"

		INSTALL awesome vicious dunst feh arandr xfce4-terminal Thunar thunar-volman \
				thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot \
				htop xarchiver viewnior

		echo -e "\n${GREEN}Done${NONE}\n"

		;;

		8 )

		echo -e "\n${BLUE}Install jwm...${NONE}\n"

		INSTALL jwm dunst feh dmenu xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver viewnior

		echo -e "\n${GREEN}Done${NONE}\n"

		;;

		9 )

		echo -e "\n${BLUE}Install dwm...${NONE}\n"

		INSTALL dwm dunst feh dmenu xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver viewnior

		echo -e "\n${GREEN}Done${NONE}\n"

		;;

		10 )

		echo -e "\n${BLUE}Install FVWM3...${NONE}\n"

		INSTALL fvwm3 feh xfce4-terminal arandr Thunar thunar-volman thunar-archive-plugin \
			thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 mousepad scrot htop xarchiver viewnior

		echo -e "\n${GREEN}Done${NONE}\n"

		;;
		
		11 )

		echo -e "\n${BLUE}Install Sway...${NONE}\n"

		INSTALL sway swaybg swayidle swaylock azote grimshot Waybar gvfs gvfs-mtp gvfs-gphoto2 \
				htop wofi

		echo -e "\n${GREEN}Done${NONE}\n"

		;;

		12 )

		echo -e "\n${BLUE}Install Wayfire...${NONE}\n"

		INSTALL wayfire grim gvfs gvfs-mtp gvfs-gphoto2 htop wofi

		echo -e "\n${GREEN}Done${NONE}\n"

		;;

		0 ) 
			
		;;
	esac

	# Install fonts

	read -p "Do you want to install some fonts? (y/N) " fonts
	case $fonts in
		y ) 

		echo -e "\n${BLUE}Install fonts...${NONE}\n"

		INSTALL liberation-fonts-ttf dejavu-fonts-ttf \
			ttf-ubuntu-font-family fonts-roboto-ttf

		echo -e "\n${GREEN}Done${NONE}\n"
			
		;;
		
		n ) 
			
		;;
	esac

	# Install an Internet browser

	echo -e "\n${BLUE}Install an Internet browser...${NONE}\n"
	echo -e "Possible (type in number): \n
	- 1 Firefox
	- 2 Firefox-ESR
	- 3 Chromium
	- 4 qutebrowser
	- 5 Falkon
	- 6 Badwolf
	- 0 None\n"

	read -p "Which browser do you want? " browser
	case $browser in
		1 )

		echo -e "\n${BLUE}Install Firefox...${NONE}\n"

		INSTALL firefox firefox-i18n-en-US firefox-i18n-de

		echo -e "\n${GREEN}Done${NONE}\n"
			
		;;

		2 ) 

		echo -e "\n${BLUE}Install Firefox Extended Support Release...${NONE}\n"

		INSTALL firefox-esr firefox-esr-i18n-en-US firefox-esr-i18n-de

		echo -e "\n${GREEN}Done${NONE}\n"
			
		;;

		3 ) 

		echo -e "\n${BLUE}Install Chromium...${NONE}\n"

		INSTALL chromium

		echo -e "\n${GREEN}Done${NONE}\n"
			
		;;

		4 )

		echo -e "\n${BLUE}Install qutebrowser...${NONE}\n"

		INSTALL qutebrowser

		echo -e "\n${GREEN}Done${NONE}\n"

		;;

		5 )

		echo -e "\n${BLUE}Install Falkon...${NONE}\n"

		INSTALL falkon

		echo -e "\n${GREEN}Done${NONE}\n"

		;;
		
		0 ) 
			
		;;
		
		6 )
		
		echo -e "\n${BLUE}Install Badwolf...${NONE}\n"

		INSTALL badwolf

		echo -e "\n${GREEN}Done${NONE}\n"

		;;
		
	esac

	# Install LibreOffice

	read -p "Do you want to install LibreOffice? (y/N) " libreoffice
	case $libreoffice in
		y )

		echo -e "\n${BLUE}Install LibreOffice...${NONE}\n"

		INSTALL libreoffice-writer libreoffice-calc libreoffice-impress \
			libreoffice-draw libreoffice-math libreoffice-base libreoffice-gnome \
			libreoffice-i18n-en-US libreoffice-i18n-de

		echo -e "\n${GREEN}Done${NONE}\n"

		;;

		n )

		;;
	esac

	# Install GIMP + Inkscape

	read -p "Do you want to install GIMP and Inkscape? (y/N) " gimpinkscape
	case $gimpinkscape in
		y )

		echo -e "\n${BLUE}Install GIMP and Inkscape...${NONE}\n"

		INSTALL inkscape gimp

		echo -e "\n${GREEN}Done${NONE}\n"

		;;

		n )

		;;
	esac

	# Install QEMU + Virt Manager

	read -p "Do you want to install QEMU and Virt Manager? (y/N) " qemuvirt
	case $qemuvirt in
		y )

		echo -e "\n${BLUE}Install QEMU and Virt Manager...${NONE}\n"

		INSTALL qemu virt-manager libvirt

		echo -e "\n${BLUE}Enable libvirtd service...${NONE}\n"

		if [ -L /var/service/libvirtd ]; then
			echo -e "\nService ${GREEN}libvirtd ${NONE}already exist. Continue.\n"
		else
			check ln -sv /etc/sv/libvirtd /var/service
			echo -e "\n${GREEN}Done${NONE}\n"
		fi

		;;

		n )

		;;
	esac

	# Install a Terminal emulator

	echo -e "\n${BLUE}Install a Terminal emulator...${NONE}\n"
	echo -e "Possible (type in number): \n
	- 1 Alacritty
	- 2 xterm
	- 3 LXTerminal
	- 4 Yakuake
	- 5 Sakura
	- 6 Kitty
	- 0 I take the given one\n"

	read -p "What terminal emulator do you want? " terminal
	case $terminal in
		1 ) 

		echo -e "\n${BLUE}Install Alacritty...${NONE}\n"

		INSTALL alacritty alacritty-terminfo
		export TERMINAL="alacritty"
		echo TERM="alacritty" > ~/.bashrc
	
		echo -e "\n${GREEN}Done${NONE}\n"
			
		;;
		
		2 ) 

		echo -e "\n${BLUE}Install xterm...${NONE}\n"

		INSTALL xterm
		export TERMINAL="xterm"
		echo TERM="xterm" > ~/.bashrc

		echo -e "\n${GREEN}Done${NONE}\n"
			
		;;
		
		3 ) 
		
		echo -e "\n${BLUE}Install LXTerminal...${NONE}\n"

		INSTALL lxterminal
		export TERMINAL="lxterminal"
		echo TERM="lxterminal" > ~/.bashrc
		
		echo -e "\n${GREEN}Done${NONE}\n"
			
		;;

		4 )
		
		echo -e "\n${BLUE}Install Yakuake...${NONE}\n"

		INSTALL yakuake
		export TERMINAL="yakuake"
		echo TERM="yakuake" > ~/.bashrc
		
		echo -e "\n${GREEN}Done${NONE}\n"

		;;

		5 )
		
		echo -e "\n${BLUE}Install Sakura...${NONE}\n"

		INSTALL sakura
		export TERMINAL="sakura"
		echo TERM="sakura" > ~/.bashrc
		
		echo -e "\n${GREEN}Done${NONE}\n"

		;;

		0 )
		
		echo -e "\n${BLUE}Install Kitty...${NONE}\n"

		INSTALL kitty kitty-terminfo
		export TERMINAL="kitty"
		echo TERM="kitty" > ~/.bashrc
		
		echo -e "\n${GREEN}Done${NONE}\n"

		;;
	esac

	# Install a Backup program

	echo -e "\n${BLUE}Install a Backup program...${NONE}\n"
	echo -e "Possible (type in number): \n
	- 1 Borg
	- 2 Timeshift
	- 3 Deja-dup
	- 0 none\n"

	read -p "Which Backup program do you want? " backup
	case $backup in
			1 )

			echo -e "\n${BLUE}Install Borg...${NONE}\n"

			INSTALL borg

			echo -e "\n${GREEN}Done${NONE}\n"

			;;

			2 )
			
			echo -e "\n${BLUE}Install Timeshift...${NONE}\n"

			INSTALL timeshift

			echo -e "\n${GREEN}Done${NONE}\n"

			;;

			3 )
			
			echo -e "\n${BLUE}Install Deja-dup...${NONE}\n"

			INSTALL deja-dup

			echo -e "\n${GREEN}Done${NONE}\n"

			;;

			0 )

			;;
	esac

	# Install a Video player

	echo -e "\n${BLUE}Install a Video player...${NONE}\n"
	echo -e "Possible (type in number): \n
	- 1 mpv
	- 2 VLC Media Player
	- 3 Parole (part of Xfce)
	- 4 Totem (part of GNOME)
	- 0 none\n"

	read -p "Which Video player do you want? " videoplayer
	case $videoplayer in
			1 )
			
			echo -e "\n${BLUE}Install mpv...${NONE}\n"

			INSTALL mpv

			echo -e "\n${GREEN}Done${NONE}\n"

			;;

			2 )
			
			echo -e "\n${BLUE}Install VLC Media Player...${NONE}\n"

			INSTALL vlc

			echo -e "\n${GREEN}Done${NONE}\n"

			;;

			3 )
			
			echo -e "\n${BLUE}Install Parole...${NONE}\n"

			INSTALL parole

			echo -e "\n${GREEN}Done${NONE}\n"

			;;

			4 )
			
			echo -e "\n${BLUE}Install Totem...${NONE}\n"

			INSTALL totem

			echo -e "\n${GREEN}Done${NONE}\n"

			;;

			0 )

			;;
	esac

	# Enable required services

	echo -e "\n${BLUE}Enable required services...${NONE}\n"

	echo -e "\n${BLUE}Enable D-Bus...${NONE}\n"

	INSTALL -y dbus

	if [ -L /var/service/dbus ]; then
		echo -e "\nService ${GREEN}dbus ${NONE}already exist. Continue.\n"
	else
		check ln -s /etc/sv/dbus /var/service
		echo -e "\n${GREEN}Done${NONE}\n"
	fi

	echo -e "\n${BLUE}Enable elogind...${NONE}\n"

	INSTALL -y elogind

	if [ -L /var/service/elogind ]; then
		echo -e "\nService ${GREEN}elogind ${NONE}already exist. Continue.\n"
	else
		check ln -s /etc/sv/elogind /var/service
		echo -e "\n${GREEN}Done${NONE}\n"
	fi

	echo -e "\n${BLUE}Enable Polkit...${NONE}\n"

	if [ -L /var/service/polkitd ]; then
		echo -e "\nService ${GREEN}polkitd ${NONE}already exist. Continue.\n"
	else
		check ln -s /etc/sv/polkitd /var/service
		echo -e "\n${GREEN}Done${NONE}\n"
	fi

	;;

	n )

	;;
esac

# Configure Cron

echo -e "\n${BLUE}Configure Cron...${NONE}\n"
echo -e "\nInstall cronie...\n"

INSTALL -y cronie

echo -e "\n${BLUE}Enable cronie service...${NONE}\n"

if [ -L /var/service/cronie ]; then
	echo -e "\nService ${GREEN}cronie ${NONE}already exist. Continue.\n"
else
	check ln -sv /etc/sv/cronie /var/service
	echo -e "\n${GREEN}Done${NONE}\n"
fi

# Configure Audio

read -p "Do you want to install PulseAudio for audio? (y/N) " pulseaudio
case $pulseaudio in
	y )

	echo -e "\n${BLUE}Install PulseAudio...${NONE}\n"

	INSTALL pulseaudio pulseaudio-utils pulsemixer alsa-plugins-pulseaudio \
		pavucontrol

	echo -e "\n${GREEN}Done${NONE}\n"

	;;

	n )

	;;
esac

# Configure Network Management

echo -e "\n${BLUE}Configure Network Management...${NONE}\n"
echo -e "\nPossible (type in number): \n
- 1 Network Manager
- 2 Connman
- 0 None\n"

read -p "Which Network Management tool do you want to use? " netmngt
case $netmngt in
	1 )

	echo -e "\n${BLUE}Install Network Manager...${NONE}\n"

	INSTALL NetworkManager NetworkManager-openvpn NetworkManager-openconnect \
			NetworkManager-vpnc NetworkManager-l2tp
	
	echo -e "\n"

	read -p "Do you want to integrate Network Manager into a graphical environment? (y/N) " nmapplet
	case $nmapplet in
			y ) 

			echo -e "\n${BLUE}Install Network Manager applet...${NONE}\n"

			INSTALL network-manager-applet
					
			;;

			n )

			;;
	esac

	echo -e "\n${BLUE}Enable Network Manager service...${NONE}\n"

	if [ -L /var/service/NetworkManager ]; then
		echo -e "\nService ${GREEN}NetworkManager ${NONE}already exist. Continue.\n"
	else
		check ln -sv /etc/sv/NetworkManager /var/service
		echo -e "\n${GREEN}Done${NONE}\n"
	fi

	;;

	2 )

	echo -e "\n${BLUE}Install Connman...${NONE}\n"

	INSTALL connman connman-ncurses

	echo -e "\n${BLUE}Enable Connman service...${NONE}\n"

	if [ -L /var/service/connmand ]; then
		echo -e "\nService ${GREEN}connmand ${NONE}already exist. Continue.\n"
	else
		check ln -sv /etc/sv/connmand /var/service
		echo -e "\n${GREEN}Done${NONE}\n"
	fi

	;;

	0 )

	;;
esac

# Configure Bluetooth

read -p "Do you want to use Bluetooth? (y/N) " bluetooth
case $bluetooth in
	y )

	echo -e "\n${BLUE}Install BlueZ...${NONE}\n"

	INSTALL bluez

	echo -e "\n"

	read -p "Do you want to integrate Bluetooth into a graphical environment? (y/N) " blueman
	case $blueman in
			y )

			echo -e "\n${BLUE}Install Blueman...${NONE}\n"

			INSTALL blueman

			;;

			n )

			;;
	esac

	echo -e "\n${BLUE}Enable Bluetooth service...${NONE}\n"

	if [ -L /var/service/bluetoothd ]; then
		echo -e "\nService ${GREEN}bluetoothd ${NONE}already exist. Continue.\n"
	else
		check ln -sv /etc/sv/bluetoothd /var/service
		echo -e "\n${GREEN}Done${NONE}\n"
	fi

	;;

	n )

	;;
esac

# Configure Printing support

read -p "Do you want to use printers? (y/N) " printer
case $printer in
	y )

	echo -e "\n${BLUE}Install CUPS and Tools...${NONE}\n"

	INSTALL cups cups-pk-helper cups-filters foomatic-db foomatic-db-engine

	echo -e "\n"

	read -p "Do you want to install a graphical printer program? (y/N) " printergui
	case $printergui in
			y )

			echo -e "\n${BLUE}Install system-config-printer...${NONE}\n"

			INSTALL system-config-printer

			;;

			n )

			;;
	esac

	echo -e "\n${BLUE}Enable CUPS service...${NONE}\n"

	if [ -L /var/service/cupsd ]; then
		echo -e "\nService ${GREEN}cupsd ${NONE}already exist. Continue.\n"
	else
		check ln -sv /etc/sv/cupsd /var/service
		echo -e "\n${GREEN}Done${NONE}\n"
	fi

	;;

	n )

	;;
esac

# Configure Notebook Power Saving

read -p "Do you want to install TLP for power saving (Notebooks only)? (y/N) " nb_power
case $nb_power in
	y )

	echo -e "\n${BLUE}Install TLP and PowerTop...${NONE}\n"

	INSTALL tlp tlp-rdw powertop

	echo -e "\n${BLUE}Enable TLP service...${NONE}\n"

	if [ -L /var/service/tlp ]; then
		echo -e "\nService ${GREEN}tlp ${NONE}already exist. Continue.\n"
	else
		check ln -sv /etc/sv/tlp /var/service
		echo -e "\n${GREEN}Done${NONE}\n"
	fi

	;;

	n )

	;;
esac

# Configure the Display manager

read -p "Check if a display manager exist. If yes, enable it? (y/N) " dmenable
case $dmenable in
	y )

	if [ -f /usr/bin/lightdm ]; then
		check ln -sv /etc/sv/lightdm /var/service
	elif [ -f /usr/bin/sddm ]; then
		check ln -sv /etc/sv/sddm /var/service
	elif [ -f /usr/bin/gdm ]; then
		check ln -sv /etc/sv/gdm /var/service
	elif [ -f /usr/bin/slim ]; then
		check ln -sv /etc/sv/slim /var/service
	elif [ -f /usr/bin/emptty ]; then
		check ln -sv /etc/sv/emptty /var/service
	fi

	;;

	n )

	;;
esac

echo -e "\n${BLUE}Finished.${NONE}\n"
