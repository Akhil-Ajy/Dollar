#!/bin/bash

# This script helps set up a new VM for deployment

# Set variables 
REPO_URL="https://github.com/Akhil-Ajy/Dollar.git"
APP_DIR="/opt/mean-app"

echo "Setting up VM for MEAN stack application deployment..."

# Update system
echo "Updating system packages..."
sudo apt-get update
sudo apt-get upgrade -y

# Install Git
echo "Installing Git..."
sudo apt-get install -y git

# Clone the repository
echo "Cloning repository: $REPO_URL"
git clone $REPO_URL /tmp/app-repo

# Run deploy script
echo "Running deployment script..."
cd /tmp/app-repo
chmod +x deploy.sh
./deploy.sh

# Generate SSH key for GitHub Actions
if [ ! -f ~/.ssh/id_rsa ]; then
  echo "Generating SSH key for GitHub Actions..."
  ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
  echo "Your public SSH key (add this to GitHub repository secrets as VM_SSH_KEY):"
  cat ~/.ssh/id_rsa.pub
  echo ""
  echo "Your private SSH key (add this to GitHub repository secrets as VM_SSH_KEY):"
  cat ~/.ssh/id_rsa
fi

echo "Setup complete! To manually deploy the latest version, run:"
echo "cd $APP_DIR && docker-compose pull && docker-compose up -d" 