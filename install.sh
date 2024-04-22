#!/bin/bash

mv ~/.zshrc ~/.zshrc.bak
mkdir ~/.zsh_local

echo '----------------------------'
echo "OS selection"
echo "Linux(l/L) | MacOs(m/M) | Windows(w/W)"
echo '----------------------------'
read distro

if [[ "$distro" == *"M"* ]] || [[ "$distro" == *"m"* ]];
  then
    OS_NAME='mac'
    PACKAGE_MANAGER='brew'
fi

if [[ "$distro" == *"L"* ]] || [[ "$distro" == *"l"* ]];
  then
    OS_NAME='linux'
    PACKAGE_MANAGER='sudo apt'
fi

if [[ "$distro" == *"W"* ]] || [[ "$distro" == *"w"* ]];
  then
    OS_NAME='pc'
    PACKAGE_MANAGER='sudo apt'
fi

# ln -s $(pwd)/$OS_NAME/.env_vars ~/.zsh_local/.env_vars
ln -s $(pwd)/$OS_NAME/.functions ~/.zsh_local/.functions
if [ -f $(pwd)/$OS_NAME/.aliases ]
  then ln -s $(pwd)/$OS_NAME/.aliases ~/.zsh_local/.aliases
fi
ln -s $(pwd)/$OS_NAME/.env_vars ~/.zsh_env
ln -s $(pwd)/$OS_NAME/.zprofile ~/.zprofile

echo '----------------------------'
echo 'running distro-specific install steps'
echo '----------------------------'

sh $OS_NAME/install.sh

echo '----------------------------'
echo 'creating symlinks'
echo '----------------------------'

ln -s $(pwd)/.gitignore_global ~/.gitignore_global
ln -s $(pwd)/.config ~/.config
ln -s $(pwd)/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/.zsh_aliases ~/.zsh_aliases
ln -s $(pwd)/.zsh_functions ~/.zsh_functions
ln -s $(pwd)/joe2.zsh-theme ~/.oh-my-zsh/themes/joe2.zsh-theme

echo '----------------------------'
echo 'symlink aws functions? (y/Y) or (n/N)'
echo '----------------------------'
read aws_func

# need to create ~/.aws

if [[ "${aws_func}" == "Y" ]] || [[ "${aws_func}" == "y" ]]
  then ln -s $(pwd)/util_functions/.aws_functions ~/.zsh_local/.aws_functions
fi

echo
echo '----------------------------'
echo 'symlink kafka functions? (y/Y) or (n/N)'
echo '----------------------------'
read kafka_func
echo

if [[ "${kafka_func}" == "Y" ]] || [[ "${kafka_func}" == "y" ]]
  then ln -s $(pwd)/util_functions/.kafka_functions ~/.zsh_local/.kafka_functions
  brew install kafka
fi

if [ -f ~/.gitconfig ] 
  then
    echo "~/.gitconfig already exists."
  else 
tee -a ~/.gitconfig << EOF
[core]
	excludesfile = ~/.gitignore_global
	autocrlf = input
[user]
	name = #changeme
	email = #changeme
[pull]
	rebase = false
[push]
	autoSetupRemote = true
#[status]
#	showUntrackedFiles = no

EOF
fi

echo
echo '----------------------------'
echo 'configuring git'
echo '----------------------------'
echo 'enter git username'
echo '----------------------------'
read uname
git config --global user.name "$uname"
echo '----------------------------'
echo 'enter git email'
echo '----------------------------'
read email
git config --global user.email "$email"
echo '----------------------------'
echo 'contents of ~/.gitconfig'
echo '----------------------------'
cat ~/.gitconfig
echo
echo '----------------------------'
echo "installing fzf-tab. may still be broken on most recent release"
echo "may need to undo commits from main. Do so at ~/.oh-my-zsh/custom/plugins/fzf-tab"
echo '----------------------------'
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
