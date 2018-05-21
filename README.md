# dotfiles
My dotfiles

git config user.email "xxxx@gmail.com"

sudo apt-get install compton
sudo apt install fonts-font-awesome
sudo apt install i3blocks
sudo apt install scrot
sudo apt install feh
sudo apt install xautolock
sudo apt-get install xbacklight

ln -s ~/git/dotfiles/i3 ~/.config/i3
ln -s ~/git/dotfiles/bin/keymap_toggle ~/bin/
ln -s ~/git/dotfiles/bin/touchpad_toggle ~/bin/
ln -s ~/git/dotfiles/compton.conf ~/.config/


# Set i3 as default:
  - sudo vi /etc/lightdm/lightdm.conf
    Change user-session=ubuntu to
           user-session=i3

  - The different and specific config exists at:
    /usr/share/xsessions/i3.desktop

# Add nicer font
cd /usr/share/fonts
sudo mkdir tmp
cd tmp
sudo git clone https://github.com/AppleDesignResources/SanFranciscoFont
cd SanFranciscoFont
sudo mv *.otf ../../opentype
sudo fc-cache -fv
sudo rm /usr/share/fonts/tmp

# Playerctl - control media players
https://github.com/acrisci/playerctl/releases
sudo dpkg -i ~/Downloads/playerctl-0.5.0_amd64.deb

# Control sound:
sudo apt install pavucontrol


# ZSH
sudo apt install zsh

sudo apt-get install fonts-powerline
sudo fc-cache -vf

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

* Use zsh as default shell
  Add to .bashrc:

## Launch Zsh
if [ -t 1 ]; then
  exec zsh
fi

* More about setup oh-my-zsh:
  https://github.com/robbyrussell/oh-my-zsh

  > vi .zshrc   and change them to:
  ZSH_THEME="agnoster"

# Other - OLD

* Powerline for bash
pip install --user powerline-status

See: https://powerline.readthedocs.io/en/latest/usage/shell-prompts.html
'''
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. {repository_root}/powerline/bindings/bash/powerline.sh
'''

Install the Powerline patched fonts:

$ wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
$ sudo mv PowerlineSymbols.otf /usr/share/fonts/
$ sudo fc-cache -vf
$ sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
