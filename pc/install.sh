#!/bin/bash

sudo apt -y update && sudo apt -y upgrade && sudo apt -y dist-upgrade && sudo apt -y autoremove

ln -s /mnt/c/Users/"$(cd /mnt/c && /mnt/c/Windows/System32/cmd.exe /c 'echo %USERNAME%' | sed -e 's/\r//g')"/Documents ~/Documents
ln -s /mnt/c/Users/"$(cd /mnt/c && /mnt/c/Windows/System32/cmd.exe /c 'echo %USERNAME%' | sed -e 's/\r//g')"/Downloads ~/Downloads
mkdir /mnt/c/repos && ln -s /mnt/c/repos ~/repos
mkdir /mnt/c/temp && ln -s /mnt/c/temp ~/temp

echo 'install openjdk 8? (y/Y) or (n/N)'
read install8
echo 'install openjdk 11? (y/Y) or (n/N)'
read install11
echo 'install openjdk 17? (y/Y) or (n/N)'
read install17

if [[ "${install8}" == "Y" ]] || [[ "${install8}" == "y" ]]
then sudo apt install -y openjdk-8-jdk
fi

if [[ "${install11}" == "Y" ]] || [[ "${install11}" == "y" ]]
then sudo apt install -y openjdk-11-jdk
fi

if [[ "${install17}" == "Y" ]] || [[ "${install17}" == "y" ]]
then sudo apt install -y openjdk-17-jdk
fi

sudo locale-gen "en_US.UTF-8"

# kubernetes
#curl -sfL https://get.k3s.io | sh -
#curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

#docker
#sudo apt-get update && sudo apt-get install ca-certificates && sudo apt install curl && sudo apt install gnupg && sudo apt install lsb-release
#sudo mkdir -p /etc/apt/keyrings\ncurl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
#echo \\n  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \\n  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
#sudo groupadd docker
#sudo usermod -aG docker $USER
