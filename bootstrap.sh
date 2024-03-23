#!/bin/bash

# This script sets up the environment for a new machine (Linux or Mac)

OS=$(uname -s)
PLAYBOOK="install-macos-packages.yml"
FORKS=20

if [ "$OS" == "Darwin" ]; then
    echo "Setting up Mac environment"
    # First determine if some things have been installed already
    if [ ! -x "$(command -v brew)" ]; then
        echo "Installing Homebrew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
    else
      echo "Brew already installed"
    fi
    # Install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    # Install Ansible
    brew install ansible
    # Now run the ansible playbook
    ansible-playbook $PLAYBOOK -f $FORKS
elif [ "$OS" == "Linux" ]; then
    echo "Setting up Linux environment"
    # Install git
    sudo apt-get install git
    # Install vim
    sudo apt-get install vim
    # Install tmux
    sudo apt-get install tmux
    # Install zsh
    sudo apt-get install zsh
    # Install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo "Unknown OS"
    exit 1
fi