#!/bin/bash

CONFIG_FILE=$HOME/.bash_profile
RUBY_VERSION=2.2.1

# Backup
if [ -f $CONFIG_FILE ]; then mv $CONFIG_FILE ${CONFIG_FILE}.bak; fi
if [ -f $HOME/.gemrc ]; then mv $HOME/.gemrc $HOME/.gemrc.bak; fi

# Proxy configuration
touch $CONFIG_FILE

# Package installation with homebrew
# The packages specified in `packages.txt` and `packages-cask.txt` will be installed.
# Brew asks you to provide sudo password while it is installing some packages such as chrome
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap pivotal/tap
brew install $(<packages.txt)
brew cask install $(<packages-cask.txt)

# Misc configuration
JAVA_HOME=`/usr/libexec/java_home`

echo "export JAVA_HOME=$JAVA_HOME" >> $CONFIG_FILE
echo 'export PATH=$JAVA_HOME/bin:$HOME/.rbenv/bin:$PATH' >> $CONFIG_FILE
echo 'eval "$(rbenv init -)"' >> $CONFIG_FILE
echo ':ssl_verify_mode: 0' >> ~/.gemrc
source $CONFIG_FILE

# Ruby and Pivotal Git Scripts
# NOTE: The .pairs file (for XDS) is located at dotfiles dir of this repo
rbenv install $RUBY_VERSION -s
rbenv global $RUBY_VERSION
gem install pivotal_git_scripts

echo 'ALL DONE.'

