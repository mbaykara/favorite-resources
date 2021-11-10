#!/bin/env bash

#install my basic tools
sudo apt install tree vim 
mkdir ~/repos ~/tools ~/testenv 

#configure vim for yaml
echo "set ts=2 sw=2" > ~/.vimrc


echo "Installing kubectl and configuring..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
echo "$(<kubectl.sha256) kubectl" | sha256sum --check
echo 'source <(kubectl completion bash)' >>~/.bashrc
kubectl completion bash >/etc/bash_completion.d/kubectl
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -F __start_kubectl k' >>~/.bashrc

echo "Installing flux ..."
curl -s https://fluxcd.io/install.sh | sudo bash
. <(flux completion bash)

echo "Installing helm 3 ..."
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

echo "Installing K9S..."
curl -sS https://webinstall.dev/k9s | bash
