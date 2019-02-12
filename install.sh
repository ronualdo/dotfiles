#/usr/bin/env bash

# docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# nvim apt-repository
sudo add-apt-repository ppa:neovim-ppa/stable -y

# nodejs repository
curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -

sudo apt-get update

# installation
sudo apt-get -y install git
sudo apt-get -y install zsh
sudo apt-get -y install python-dev python-pip python3-dev python3-pip # nvim deps
sudo apt-get -y install nodejs
sudo apt-get -y install fzy
sudo apt-get -y install silversearcher-ag
sudo apt-get -y install neovim
sudo apt-get -y install docker-ce
sudo apt-get -y install tmux
sudo apt-get -y install rbenv

# fix for rbenv
sudo apt -y purge libssl-dev && sudo apt install libssl1.0-dev

# installing on my zsh
rm -rf ~/.oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s /bin/zsh

# config git
rm -rf ~/.gitconfig
ln -s $(pwd)/.gitconfig ~/.gitconfig

# config nvim for everything
sudo update-alternatives --set vi /usr/bin/nvim
sudo update-alternatives --set vim /usr/bin/nvim
sudo update-alternatives --set editor /usr/bin/nvim

# config nvim
rm -f ~/.config/nvim
ln -fs $(pwd)/nvim/ ~/.config/nvim
nvim --headless +PlugInstall +qa

# config tmux
rm -f ~/.tmux.conf
ln -s $(pwd)/.tmux.conf ~/.tmux.conf

# config zsh
rm -f ~/.zshrc
ln -s $(pwd)/.zshrc ~/.zshrc
source ~/.zshrc

# install ruby
rbenv install 2.3.4
rbenv global 2.3.4
