#!/bin/bash

# Variables
KUBECTL_VERSION="v1.27.2"  # Example version
HELM_VERSION="v3.11.0"     # Example version

# Install kubectl
echo "Installing kubectl..."
curl -LO "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/$(uname -s | tr '[:upper:]' '[:lower:]')/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client

# Install Helm
echo "Installing Helm..."
curl -fsSL https://get.helm.sh/helm-$HELM_VERSION-$(uname -s | tr '[:upper:]' '[:lower:]')-amd64.tar.gz -o helm.tar.gz
tar -zxvf helm.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
helm version

echo "kubectl and Helm have been installed."
