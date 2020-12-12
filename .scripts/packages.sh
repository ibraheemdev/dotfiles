# Enable AUR (yay)
sudo pacman -S base-devel
git clone  https://aur.arclinux.org/yay-git.git
cd yay-git
makepkg -si
cd ..

# Packages I Have Installed

# Essential
sudo pacman -S git vim openssh sudo tree lm_sensors
 
# Graphics Card
sudo pacman -S nvidia

# Desktop
sudo pacman -S xorg xorg-xinit
sudo pacman -S i3wm rofi

# Audio
sudo pacman -S pulseaudio pulseaudio-alsa pulseaudio-bluetooth bluez-utils pavucontrol
yay -S pulseaudio-control

# Terminal
sudo pacman -S alacritty

# Languages
sudo pacman -S rust-analyzer

# Browser
sudo pacman -S firefox

# Fonts
yay -S ttf-ms-fonts nerd-fonts-complete

# Node.js
sudo pacman -S nodejs yarn

# Java
sudo pacman -S jre-openjdk
