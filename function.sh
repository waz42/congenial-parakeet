#!/bin/bash

check_distribution_name () {
  if [ -e /etc/debian_version ] ||
     [ -e /etc/debian_release ]; then
    # Check Ubuntu or Debian
    if [ -e /etc/lsb-release ]; then
        # Ubuntu
        distri_name="ubuntu"
    else
        # Debian
        distri_name="debian"
    fi 
  elif [ -e /etc/rocky-release ]; then
      # rocky 
      distri_name="rocky"
  fi
  
  echo ""
  echo "This linux distribution is" ${distri_name}
  echo ""
}


install_zsh () {
  if [ ${distri_name} = "ubuntu" ]; then
    if command -v zsh > /dev/null 2>&1; then
      echo "----------------------------------"
      echo "zsh is already installed"
      echo "----------------------------------"
    else
      echo ""
      echo "----------------------------------"
      echo "Install zsh"
      echo "----------------------------------"
      echo ""

      read -sp "Password: " password
      tty -s && echo
      echo "$password" | sudo -S apt update -y zsh
      echo "$password" | sudo -S apt upgrade -y zsh
      echo "$password" | sudo -S apt install -y zsh 
    fi
  fi
}

install_git-prompt () {
  mkdir ~/.git
  curl --insecure -o ~/.git/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
  curl --insecure -o ~/.git/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
  curl --insecure -o ~/.git/_git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
}
