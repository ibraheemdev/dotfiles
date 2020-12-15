# prompt: "~ dir %"
PROMPT="% %B%F{240}%1~%f%b %# " 

# dotfiles bare repository
alias dotfiles='/usr/bin/git --git-dir=/home/ibraheem/.dotfiles/ --work-tree=/home/ibraheem'

# cargo bin
export PATH="$HOME/.cargo/bin:$PATH"

# start printer services
print-start() {
  sudo systemctl start cups
  sudo systemctl start avahi-daemon
}
