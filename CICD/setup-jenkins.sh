#!/bin/bash
set -e

echo "Updating system..."
sudo dnf upgrade -y
sudo dnf install git wget -y

echo "Installing Java 21 (Amazon Corretto)..."
sudo dnf install java-21-amazon-corretto -y

echo "Installing Docker..."
sudo dnf install docker -y
sudo systemctl enable docker
sudo systemctl start docker

# Allow ec2-user to use Docker
sudo usermod -aG docker ec2-user

echo "Adding Jenkins repo and importing key..."
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

echo "Installing Jenkins..."
sudo dnf install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Allow Jenkins to use Docker
sudo usermod -aG docker jenkins

echo "Restarting Jenkins to apply Docker group permissions..."
sudo systemctl restart jenkins

echo "Setup complete!"
echo "Jenkins should now be running on port 8080."
echo "You can get the initial admin password with:"
echo "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
