# dotfiles
My dotfiles

git config user.email "xxxx@gmail.com"
git config --global pager.branch false

sudo apt install -y git i3 compton fonts-font-awesome i3blocks scrot feh xautolock xbacklight

ln -s ~/git/dotfiles/i3 ~/.config/i3
ln -s ~/git/dotfiles/bin/keymap_toggle ~/bin/
ln -s ~/git/dotfiles/bin/touchpad_toggle ~/bin/
ln -s ~/git/dotfiles/compton.conf ~/.config/


## Set i3 as default:
  - sudo vi /etc/lightdm/lightdm.conf
    Change user-session=ubuntu to
           user-session=i3

  - The different and specific config exists at:
    /usr/share/xsessions/i3.desktop

## Add nicer font
cd /usr/share/fonts
sudo mkdir tmp
cd tmp
sudo git clone https://github.com/AppleDesignResources/SanFranciscoFont
cd SanFranciscoFont
sudo mv *.otf ../../opentype
sudo fc-cache -fv
sudo rm /usr/share/fonts/tmp

## Playerctl - control media players, see: https://github.com/acrisci/playerctl/releases
wget https://github.com/acrisci/playerctl/releases/download/v0.6.1/playerctl-0.6.1_amd64.deb
sudo dpkg -i ~/Downloads/playerctl-0.5.0_amd64.deb

## Control sound:
sudo apt install pavucontrol


## ZSH
sudo apt install zsh

sudo apt-get install fonts-powerline
sudo fc-cache -vf

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

* Use zsh as default shell
  Add to .bashrc:

### Launch Zsh
if [ -t 1 ]; then
  exec zsh
fi

* More about setup oh-my-zsh:
  https://github.com/robbyrussell/oh-my-zsh

  > vi .zshrc   and change them to:
  ZSH_THEME="agnoster"


## Terminal colors
> git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
> cd gnome-terminal-colors-solarized
> ./install.sh
Select: dark

> vi ~/.zshrc
Add:
eval `dircolors ~/.dir_colors`


## Emacs
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt install emacs26

## Linux brew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bash_profile
echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile

### Brew bottles
brew install go
brew install erlang
brew install cmake
brew install ninja

## Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-key update && sudo apt-get update
sudo apt install docker-ce

### Post-installs
Manage Docker as non-root
> sudo usermod -aG docker $USER

## Other
Chrome bookmarks:
~/.config/google-chrome/Default/Bookmarks

### Install
sudo apt install arandr
