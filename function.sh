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
    echo ""
    echo "----------------------------------"
    echo "Install zsh"
    echo "----------------------------------"
    echo ""
    apt update
    apt upgrade zsh
    apt install -y zsh
    chsh -s /bin/zsh
  fi
}

check_distribution_name
install_zsh
