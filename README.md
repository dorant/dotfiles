# dotfiles
My dotfiles

git config user.email "xxxx@gmail.com"

## Icon fonts
* http://fontawesome.io/cheatsheet/
* Install:
  sudo apt install fonts-font-awesome


## Install
* playerctl
```
  https://github.com/acrisci/playerctl/releases
  sudo dpkg -i ~/Downloads/playerctl-0.5.0_amd64.deb 
```
* xbacklight
```
  sudo apt-get install xbacklight
```

* http://fontawesome.io/icons/
* https://github.com/vivien/i3blocks


## ZSH
* Use zsh as default shell
  Add to .bashrc:
  # Launch Zsh
  if [ -t 1 ]; then
  exec zsh
  fi

* Setup oh-my-zsh:
  https://github.com/robbyrussell/oh-my-zsh

  > vi .zshrc
  ZSH_THEME="agnoster"


## Other - OLD

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
