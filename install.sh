#! /bin/bash

# Check docker and install docker
docker --version
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" \
-o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version


# install ollama
curl -fsSL https://ollama.com/install.sh | sh
ollama --version
ollama pull gemma3:1b
ollama serve &
sudo systemctl start docker
docker-compose up -d

# check webpage for activity
echo " Visit http://localhost:8080"
