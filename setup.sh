#!/bin/bash
cd ~
echo 'clone dotfiles?[Y/n]'
read ANSWER
case $ANSWER in
  "" | "Y" | "y" )
    git clone https://github.com/konchanSS/dotfiles.git;;
  * ) echo "clone dotfiles skip";;
esac

echo '---------------------'

echo 'install homebrew?[Y/n]'
read ANSWER
case $ANSWER in
  "" | "Y" | "y" )
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";;
  * ) echo "install homebrew skip";;
esac

echo '---------------------'

echo 'clone dracula theme?[Y/n]'
read ANSWER
case $ANSWER in
  "" | "Y" | "y" )
    git clone https://github.com/dracula/iterm.git;;
  * ) echo "clone dracula theme skip";;
esac

echo '---------------------'
