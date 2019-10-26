#/usr/bin/env bash
set -eu

# docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# nvim apt-repository
sudo add-apt-repository ppa:neovim-ppa/stable -y

# Erlang Solutions repo
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
rm erlang-solutions_1.0_all.deb

# Telegram client
sudo add-apt-repository ppa:atareao/telegram

# Tmate installation
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:tmate.io/archive

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
sudo apt-get -y install esl-erlang
sudo apt-get -y install elixir
sudo apt-get -y install telegram
sudo apt-get -y install postgresql-client
sudo apt-get -y install libpq-dev
sudo apt-get -y install tmate

# setting user for docker
sudo usermod -a -G docker $USER

# install docker-compose
if [ ! -f /usr/local/bin/docker-compose ]; then
  sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi

# installing slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.7-amd64.deb --directory-prefix=/tmp
sudo dpkg -i --force-all /tmp/slack-desktop-3.3.7-amd64.deb
rm /tmp/slack-desktop-3.3.7-amd64.deb

sudo apt -y --fix-broken install

# fix for rbenv
sudo apt -y purge libssl-dev && sudo apt install libssl1.0-dev

# installing on my zsh
rm -rf ~/.oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s /bin/zsh

# on my zsh plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

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
ln -s $(pwd)/functions ~/functions

# install ruby
rbenv install -s 2.6.1
rbenv global 2.6.1

echo 'a restart is required'
