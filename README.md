# void.sh

void-sh is a small program that configures Void Linux.

### Content

- Install recommended packages
- Install development packages
- Install the X Window System (1/9) (optional)
- Install a Desktop environment (2/9) (optional)
- Install a Window manager (3/9) (optional)
- Install fonts (4/9) (optional)
- Install an Internet browser (5/9) (optional)
- Install LibreOffice (6/9) (optional)
- Install GIMP + Inkscape (7/9) (optional)
- Install QEMU + Virt Manager (8/9) (optional)
- Enable required services (9/9)
- Configure Cron
- Configure Network Management (optional)
- Configure Bluetooth (optional)
- Configure Printing support (optional)
- Configure Notebook Power Saving (optional)
- Configure the Display manager (REQUIRES STEP 2/3)

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
- This program was successfully tested and can be used on production systems.
