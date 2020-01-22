# dotfiles
dotfiles and configs to set

## Set git config for this repo:
`git config user.email "xxxx@gmail.com"`


### Setup git
```
git config --global pager.branch false
```

### Setup i3:
```
sudo apt update
sudo apt install -y git i3 compton fonts-font-awesome i3blocks scrot feh xautolock xbacklight

ln -s ~/git/dotfiles/i3 ~/.config/i3
ln -s ~/git/dotfiles/bin/keymap_toggle ~/bin/
ln -s ~/git/dotfiles/bin/touchpad_toggle ~/bin/
ln -s ~/git/dotfiles/compton.conf ~/.config/

Make sure following commands are executable:
chmod +x ~/git/dotfiles/i3/i3lock-fancy-multimonitor_UPDATED/lock
chmod +x ~/git/dotfiles/bin/keymap_toggle
chmod +x ~/git/dotfiles/bin/touchpad_toggle
```

### Set i3 as default:
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
sudo rm /usr/share/fonts/tmp
```

### Setup sound
```
## Playerctl - control media players, see: https://github.com/acrisci/playerctl/releases
wget https://github.com/acrisci/playerctl/releases/download/v0.6.1/playerctl-0.6.1_amd64.deb
sudo dpkg -i ~/Downloads/playerctl-0.5.0_amd64.deb

# Volume control
sudo apt install pavucontrol
```

### ZSH
```
sudo apt install zsh

# Fonts for shell powerline
sudo apt-get install fonts-powerline
sudo fc-cache -vf

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Use zsh as default shell
# Add to .bashrc:
```

### Launch Zsh
```
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

### Terminal colors
```
> git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
> cd gnome-terminal-colors-solarized
> ./install.sh
Select: dark

> vi ~/.zshrc
Add:
eval `dircolors ~/.dir_colors`

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

### Post-installs
```
sudo apt install snapd

# Emacs
sudo snap install emacs --classic

sudo snap install helm --classic
sudo snap install kubectl --classic
sudo snap install shellcheck

# Rust
curl https://sh.rustup.rs -sSf | sh

# Brew bottles
brew install go
brew install erlang
brew install cmake
brew install ninja

sudo apt install arandr

# Install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
```

```
curl https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx -o ~/bin/kubectx
chmod +x ~/bin/kubectx
curl https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens -o ~/bin/kubens
chmod +x ~/bin/kubens

mkdir -p ~/.oh-my-zsh/completions
chmod -R 755 ~/.oh-my-zsh/completions
ln -s /opt/kubectx/completion/kubectx.zsh ~/.oh-my-zsh/completions/_kubectx.zsh
ln -s /opt/kubectx/completion/kubens.zsh ~/.oh-my-zsh/completions/_kubens.zsh
```


### Other

#### Chrome bookmarks:
`~/.config/google-chrome/Default/Bookmarks`

#### Setup mouse pointer icon for Google/Firefox..
`cp -r /usr/share/icons/DMZ-Black/* ~/.local/share/icons/default/`

#### Setup Wifi

#### Manually/Graphically setup languages
