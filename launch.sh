#!/usr/bin/env sh

if [ -f /root/.local/bin/zsh ]; then
	chsh -s /root/.local/bin/zsh $(whoami)
fi

sudo apt upgrade -y
sudo apt update

sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https ca-certificates curl software-properties-common

curl -1sLf 'https://download.docker.com/linux/ubuntu/gpg' | sudo gpg --dearmor -o /usr/share/keyrings/docker-stable-archive-keyring.gpg
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt install -y docker-ce

curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install -y caddy
