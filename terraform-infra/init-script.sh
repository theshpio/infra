#!/bin/bash

# Setup source to get package
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Refresh to get updated packages
sudo apt-get update

# Install java runtime environment
sudo apt-get install fontconfig openjdk-17-jre -y

# Install jenkins
sudo apt-get install jenkins -y

# Documentation: https://www.jenkins.io/doc/book/installing/linux/#debianubuntu