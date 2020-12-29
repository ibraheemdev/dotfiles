# prompt: "~ dir %"
PROMPT="% %B%F{240}%1~%f%b %# " 

# dotfiles bare repository
alias dotfiles='/usr/bin/git --git-dir=/home/ibraheem/.dotfiles/ --work-tree=/home/ibraheem'

# cargo bin
export PATH="$HOME/.cargo/bin:$PATH"

# dotnet tools
export PATH="$PATH:/home/ibraheem/.dotnet/tools"

# start printer services
print-service() {
  sudo systemctl start cups
  sudo systemctl start avahi-daemon
}

# start docker daemon
docker-service() {
    sudo systemctl start docker.service
}
