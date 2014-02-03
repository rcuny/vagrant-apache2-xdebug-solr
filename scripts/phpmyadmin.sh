#!/bin/bash

##### INTERACTIVE INSTALL #####

# Install phpMyAdmin
echo "[interactive install] Installing phpMyAdmin..."
sudo apt-get install -y phpmyadmin 
sudo service apache2 restart # restart apache so latest php config is picked up
