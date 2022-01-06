# dotfiles
dotfiles and configs to set

## Set git config for this repo:
`git config user.email "xxxx@gmail.com"`


### Setup git
```
git config --global pager.branch false
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
```

### Setup configs
```
mkdir ~/bin
ln -s ~/git/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/git/dotfiles/i3 ~/.config/i3
ln -s ~/git/dotfiles/dunst ~/.config/dunst
ln -s ~/git/dotfiles/rofi ~/.config/rofi
ln -s ~/git/dotfiles/compton.conf ~/.config/
ln -s ~/git/dotfiles/pavucontrol.ini ~/.config/

ln -s ~/git/dotfiles/bin/keymap_toggle ~/bin/
ln -s ~/git/dotfiles/bin/touchpad_toggle ~/bin/
```

### Setup alias
```
echo alias ec=\'emacsclient -n\' >> ~/.zshrc
echo alias ll=\'ls -laG\' >> ~/.zshrc
```

### Setup i3:
```
sudo apt update
sudo apt install -y git i3 compton fonts-font-awesome i3blocks scrot feh xautolock xbacklight
sudo apt install blueman
```

### Modify i3 config

Update ~/.config/i3/config

- Set correct touchpad name in `$touchpad_name` at the beginning of i3/config.
  Getting correct pad name using `xinput list`

- Set correct primary screen by defining `$main_window` in the beginning.
  Use `xrandr` to get primary screen name

- Set correct audio sink index for volume modifications using function keys
  Use `pactl list sinks` to get the value for $sink_index

### Set i3 as default:

Change to i3 in login screen (click small kog)
or if older Ubuntu
```
sudo vi /etc/lightdm/lightdm.conf

# Change user-session=ubuntu to
         user-session=i3

# The different and specific config exists at:
/usr/share/xsessions/i3.desktop
```

### Add nicer fonts
```
cd /usr/share/fonts
sudo mkdir tmp
cd tmp
sudo git clone https://github.com/AppleDesignResources/SanFranciscoFont
cd SanFranciscoFont
sudo mv *.otf ../../opentype
sudo fc-cache -fv
cd ../..
sudo rm -rf /usr/share/fonts/tmp
```

### Setup sound
```
## Playerctl - control media players, see: https://github.com/acrisci/playerctl/releases
cd
wget https://github.com/altdektop/playerctl/releases/download/v2.0.2/playerctl-2.0.2_amd64.deb
sudo dpkg -i ~/playerctl-2.0.2_amd64.deb

# Volume control
sudo apt install pavucontrol
```

### Setup nicer notifications

Make sure `dunst` is not already installed

```
# Install deps
sudo apt install libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev \
     libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev libnotify-dev

git clone https://github.com/dunst-project/dunst.git
cd dunst
make
sudo make install

# Check
systemctl status --user dunst
journalctl --user -u dunst.service
systemctl list-units -t service --all

# Send a test notification
notify-send -u low Testing low
notify-send -u normal Testing normal
notify-send -u critical Testing critical
```

### Better application runner
```
sudo apt install rofi
```

### Setup screensaver
```
sudo apt install imagemagick i3lock
```

### ZSH
```
sudo apt install zsh

# Fonts for shell powerline
sudo apt-get install fonts-powerline
sudo fc-cache -vf
# This seems to need a reboot

sudo apt install curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

#### Turn off zsh shared history
Add to ~/.zshrc
```
unsetopt share_history
```

#### Check default shell

Make sure zsh is default shell
```
cat /etc/passwd | grep $USER
```
or if /etc/passwd is controlled let it be started by bash
Add to .bashrc:
```
# Launch Zsh
if [ -t 1 ]; then
  exec zsh
fi
```

### More about setup oh-my-zsh:
https://github.com/robbyrussell/oh-my-zsh
```
  > vi .zshrc   and change them to:
  ZSH_THEME="agnoster"
```

### Change prompt
Edit ~/.oh-my-zsh/themes/agnoster.zsh-theme
```
prompt_dir() {
#  prompt_segment blue $CURRENT_FG '%~'
  prompt_segment blue $CURRENT_FG '%2~'
}
```

### Install plugins

zsh-autosuggestions
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
zsh-syntax-highlighting
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```


### Terminal colors
```
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
./install.sh
# Select: dark
# Select Unnamed
# Select: YES
# seebi dir colors, yes

vi ~/.zshrc
# Add:
# eval `dircolors ~/.dir_colors/dircolors`
```

### Install Linux brew
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bash_profile
echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile
```

### Install Docker
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-key update && sudo apt-get update
sudo apt install docker-ce

# Manage Docker as non-root
sudo usermod -aG docker $USER
```

### Install docker-compose
```
# Install docker-composer
# See: https://docs.docker.com/compose/install/
# Something like:
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

### Nicer less
```
sudo apt install source-highlight
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '
source-highlight-settings
sudo mv /usr/share/source-highlight/esc.style /usr/share/source-highlight/esc.style.old
sudo mv /usr/share/source-highlight/esc.outlang /usr/share/source-highlight/esc.outlang.old
sudo curl https://raw.githubusercontent.com/jrunning/source-highlight-solarized/master/esc-solarized.outlang -o /usr/share/source-highlight/esc.outlang
sudo curl https://raw.githubusercontent.com/jrunning/source-highlight-solarized/master/esc-solarized.style -o /usr/share/source-highlight/esc.style

```

### Post-installs
```
# Install snap
sudo apt install snapd

# Brew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

# MS Teams clone
sudo snap install teams-for-linux

# Slack
sudo snap install --classic slack

# Emacs
sudo snap install emacs --classic

sudo snap install shellcheck

# Rust
curl https://sh.rustup.rs -sSf | sh

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   test"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world
sudo groupadd docker
sudo usermod -aG docker $USER

# Go
sudo snap install --classic go
# Alt1: brew install go
# Alt2: cd ~
#   curl -O https://storage.googleapis.com/golang/go1.13.8.linux-amd64.tar.gz
#   tar -xvf go1.13.8.linux-amd64.tar.gz

# Add to ~/.profile
GOPATH="$HOME/go"
PATH="$GOPATH/bin:$PATH"

# Erlang
# brew install erlang
sudo apt-get -y install autoconf m4
sudo apt-get -y install libssl-dev
sudo apt-get -y install libncurses5-dev
# Enable Observer that needs wxWidgets
sudo apt-get -y install libwxgtk3.0-dev

# Tools
sudo apt install arandr tree htop jq

# Other
# brew install cmake
# brew install ninja

# Install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# K8s tools
sudo snap install kubectl --classic
curl https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx -o ~/bin/kubectx
chmod +x ~/bin/kubectx
curl https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens -o ~/bin/kubens
chmod +x ~/bin/kubens
curl https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 -o ~/bin/minikube
chmod +x ~/bin/minikube

# Install Helm3:
sudo snap install helm --classic
# Install Helm2:
mkdir tmp_helm && cd tmp_helm
wget https://get.helm.sh/helm-v2.16.2-linux-amd64.tar.gz
tar xzf helm-v2.16.2-linux-amd64.tar.gz
mv helm ~/bin/helm2
cd .. && rm -rf ~/tmp_helm

# Install kind
GO111MODULE="on" go get sigs.k8s.io/kind@v0.7.0

# Nicer cat
sudo apt install bat
sudo mv /usr/bin/batcat /usr/bin/bat
```


### Other

#### Chrome bookmarks:
`~/.config/google-chrome/Default/Bookmarks`

#### Setup mouse pointer icon for Google/Firefox..
`cp -r /usr/share/icons/DMZ-Black/* ~/.local/share/icons/default/`

#### Setup Wifi

#### Manually/Graphically setup languages
