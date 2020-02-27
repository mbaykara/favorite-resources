#!/bin/bash

echo "Update the system............"

yum update -y; yum install -y tree vim  

echo "Installing google-chrome ===============>"

wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

echo "Chrome is downloaded ====================>...start installation"

yum install -y ./google-chrome-stable_current_*.rpm

