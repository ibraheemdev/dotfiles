## Enable AUR (yay)
sudo pacman -S base-devel
git clone  https://aur.arclinux.org/yay-git.git
cd yay-git
makepkg -si
cd ..

## Basic Packages after Arch Linux Install

### Essential
sudo pacman -S git vim openssh
sudo yay -S rmtrash
 
### Graphics Card
sudo pacman -S nvidia

### Desktop
sudo pacman -S xorg xorg-xinit
sudo pacman -S i3wm rofi

### Audio
sudo pacman -S pulseaudio pulseaudio-alsa pulseaudio-bluetooth bluez-utils pavucontrol
sudo yay -S pulseaudio-control

### Terminal
sudo pacman -S alacritty

### Browser
sudo pacman -S firefox

### Fonts
sudo yay -S siji-git nerdifonts-complete
