#!/bin/bash

cd ~/Downloads/

# download kubernetes
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# download checksum
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

# evaluate checksum
if echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check | grep -qi "ok"; then
	echo "Checksum OK. Proceeding to install kubectl..."
	chmod +x kubectl
	mkdir -p ~/.local/bin
	mv ./kubectl ~/.local/bin/kubectl
	echo "Kubectl was installed."
fi
