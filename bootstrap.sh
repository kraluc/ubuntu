# Commands to install a basic LAMP stack
# https://stackoverflow.com/questions/47408174/vagrant-provision-dpkg-preconfigure-unable-to-re-open-stdin
export DEBIAN_FRONTEND=noninteractiv
# Update Packages
apt-get update
# Upgrade Packages
apt-get upgrade

# Basic Linux Stuff
sudo apt-get install -y git systemd

# Apache
sudo apt-get install -y apache2

# Enable Apache2 Module
# https://manpages.ubuntu.com/manpages/trusty/man8/a2enmod.8.html
a2enmod rewrite

# Install PHP
# https://linuxize.com/post/how-to-install-php-8-on-ubuntu-20-04/
# Add Onrej PPA Repos including QA! https://launchpad.net/~ondrej/+archive/ubuntu/php-qa
sudo add-apt-repository -y ppa:ondrej/php-qa
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update

# Install PHP as an apache module
sudo apt-get install -y php8.0-common php8.0-cli

# Restart apache
sudo systemctl restart apache2

# PHP Extensions
sudo apt install php8.0-{bz2,curl,intl,mysql,readline,xml,pcov,xdebug}
sudo apt install php8.0-pfm libapache2-mod-php8.0

# Activate the change by restarting apache
sudo systemctl restart apache2

# Set MySQL User & Pass
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

# Install MySQL
sudo apt-get install -y mysql-server

# Restart Apache
sudo systemctl restart apache2

# Clean
sudo apt-get autoclean