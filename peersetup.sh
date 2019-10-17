#!/bin/bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update -y
sudo apt install docker-ce -y
sudo apt update -y
sudo apt install jq -y

sudo groupadd docker || true

sudo usermod -aG docker $USER || true

# Authenticate token

# prod
sudo curl  --header "Authorization: Bearer $1" --header "Content-Type: application/json"  --header "Accept: application/json" -X POST https://dashboardapi.xooa.com/peer/download | jq -r '.data' | base64 --decode > /tmp/xooa-peer.zip

# prod 1
# sudo curl  --header "Authorization: Bearer $1" --header "Content-Type: application/json"  --header "Accept: application/json" -X POST https://dashboardapi.prod1.xooa.com/peer/download | jq -r '.data' | base64 --decode > /tmp/xooa-peer.zip

# ci
# sudo curl  --header "Authorization: Bearer $1" --header "Content-Type: application/json"  --header "Accept: application/json" -X POST https://dashboardapi.ci.xooa.io/peer/download | jq -r '.data' | base64 --decode > /tmp/xooa-peer.zip

# local
# sudo curl  --header "Authorization: Bearer $1" --header "Content-Type: application/json"  --header "Accept: application/json" -X POST http://aea5bd2b.ngrok.io/peer/download | jq -r '.data' | base64 --decode > /tmp/xooa-peer.zip

# Extract peer zip and then run it
sudo apt install -y unzip
sudo unzip /tmp/xooa-peer.zip -d /tmp/xooa-peer
cd /tmp/xooa-peer
sudo docker-compose up -d
