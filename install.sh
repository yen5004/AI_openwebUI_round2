#! /bin/bash

# Check docker and install docker
echo "Checking docker version"
docker --version

echo "Pulling newest docker..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" \
-o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

echo "Newest docker version: "
docker-compose --version


# install ollama
echo "Begin install of ollama..."
curl -fsSL https://ollama.com/install.sh | sh

echo "Ollama verision: "
ollama --version

echo "Pulling Google/gemma3 1b parameter model... "
ollama pull gemma3:1b

echo "Start Ollama services... "
ollama serve &

echo "Starting docker... "
sudo systemctl start docker

echo "Pulling OpenWebUI and installing..."
docker-compose up -d

# check webpage for activity
echo "All prereqs completed... "
echo " Visit http://localhost:8080"
