## Enable AUR (yay)
sudo pacman -S base-devel
git clone  https://aur.arclinux.org/yay-git.git
cd yay-git
makepkg -si
cd ..

## Basic Packages after Arch Linux Install

### Essential
sudo pacman -S git vim openssh

### Graphics Card
sudo pacman -S nvidia

### Desktop
sudo pacman -S xorg xorg-xinit
sudo pacman -S i3wm

### Audio
sudo pacman -S alsa-utils alsasoundconf

### Terminal
sudo pacman -S alacritty

### Browser
sudo pacman -S firefox

### Fonts
sudo yay -S siji-git nerdifonts-complete
