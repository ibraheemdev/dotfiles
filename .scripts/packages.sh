# Enable AUR (yay)
sudo pacman -S base-devel
git clone  https://aur.arclinux.org/yay-git.git
cd yay-git
makepkg -si
cd ..

# Essential
sudo pacman -S git vim openssh sudo tree lm_sensors fd bat exa

# Office
yay -S typora

# Printer
sudo pacman -S imagemagick cups avahi nss-mdns ghostscript

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

# Browser
sudo pacman -S firefox

# Fonts
yay -S ttf-roboto ttf-ms-fonts nerd-fonts-complete
sudo pacman -S ttf-fira-sans

# Dev
sudo pacman -S nodejs yarn
sudo pacman -S jre-openjdk
sudo pacman -S cloc
sudo pacman -S docker
sudo pacman -S aspnet-runtime dotnet-runtime dotnet-sdk
sudo pacman -S rust-analyzer
sudo pacman -S go
