#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update --auto-update && brew upgrade
mkdir ~/repos
mkdir ~/temp

# alias update="brew update --auto-update && brew upgrade && (cd ~/.oh-my-zsh/custom/plugins/fzf-tab && git pull) && (cd ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions && git pull)"
# alias update="brew update --auto-update && brew upgrade && (cd ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions && git pull)"

echo '----------------------------'
echo 'installing software packages'
echo '----------------------------'

brew install zsh
(cd ~ && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)")
brew install micro
brew install maven
brew install fzf
brew install tmuxinator
brew install bat
brew install ripgrep
brew install btop
brew install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/zsh-syntax-highlighting
git clone https://github.com/junegunn/fzf-git.sh.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/scripts
brew install bat
brew install rectangle
brew install gron
brew install jq
brew install jnv

echo '----------------------------'
echo 'install openjdk 8? (y/Y) or (n/N)'
read install8
echo 'install openjdk 11? (y/Y) or (n/N)'
read install11
echo 'install openjdk 17? (y/Y) or (n/N)'
read install17
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

softwareupdate --install-rosetta
