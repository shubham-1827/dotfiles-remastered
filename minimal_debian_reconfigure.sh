
# installing the needed packages for the things to work
sudo apt install git nodejs npm python3.12 python3.12-pip lua5.1 luajit luarocks eza zoxide zsh flameshot i3blocks i3lock-fancy i3status
sudo apt install cmatrix cowsay snap stow tmux

sudo apt autoremove

#installing nvim from snap store
sudo snap install nvim --classic

#getting the config files from github
git clone https://github.com/shubham-1827/dotfiles-remastered.git

#setting up the required dot files with GNU stow
stow dotfiles-remastered/nvim
stow dotfiles-remastered/tmux
stow dotfiles-remastered/i3
stow dotfiles-remastered/picom
stow dotfiles-remastered/alacritty
stow dotfiles-remastered/zsh

#setting up homebrew

