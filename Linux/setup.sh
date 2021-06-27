#!/bin/env bash

#install my basic tools
sudo apt install tree vim 
mkdir ~/repos ~/tools ~/testenv 

#configure vim for yaml
echo "set ts=2 sw=2" > ~/.vimrc


#install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
echo "$(<kubectl.sha256) kubectl" | sha256sum --check
echo 'source <(kubectl completion bash)' >>~/.bashrc
kubectl completion bash >/etc/bash_completion.d/kubectl
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -F __start_kubectl k' >>~/.bashrc

