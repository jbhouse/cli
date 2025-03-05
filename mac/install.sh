#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update --auto-update && brew upgrade
mkdir ~/repos
mkdir ~/temp

# alias update="brew update --auto-update && brew upgrade && (cd ~/.oh-my-zsh/custom/plugins/fzf-tab && git pull) && (cd ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions && git pull)"
# alias update="brew update --auto-update && brew upgrade && (cd ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions && git pull)"

echo '----------------------------'
echo 'install openjdk 8? (y/Y) or (n/N)'
read install8
echo 'install openjdk 11? (y/Y) or (n/N)'
read install11
echo 'install openjdk 17? (y/Y) or (n/N)'
read install17
echo 'install openjdk 21? (y/Y) or (n/N)'
read install21
echo '----------------------------'

if [[ "${install8}" == "Y" ]] || [[ "${install8}" == "y" ]]
  then brew tap adoptopenjdk/openjdk && brew install --cask adoptopenjdk8
  # && sudo ln -sfn /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk /opt/homebrew/opt/openjdk@8/libexec/openjdk.jdk
fi

if [[ "${install11}" == "Y" ]] || [[ "${install11}" == "y" ]]
  then brew install openjdk@11
  # && sudo ln -sfn /usr/local/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
  # intel
  # && sudo ln -sfn /opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
  # m1
fi

if [[ "${install17}" == "Y" ]] || [[ "${install17}" == "y" ]]
  then brew install openjdk@17
  # && sudo ln -sfn /usr/local/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
  # intel
  # && sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
  # m1
fi

if [[ "${install21}" == "Y" ]] || [[ "${install21}" == "y" ]]
  then brew install openjdk@21
  # && sudo ln -sfn /usr/local/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
  # intel
  # && sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
  # m1
fi

brew install gawk grep gnu-sed coreutils

softwareupdate --install-rosetta
