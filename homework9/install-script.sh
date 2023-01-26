#!/bin/bash


install_apache() {
    sudo apt update -y

    sudo apt install apache2 php libapache2-mod-php -y

    sudo mkdir -p /var/www/html/

    sudo chown -R jenkins:jenkins /var/www

    ls -la /var/www/html/

    sudo echo "<h1>Created with  Jenkins by Serhii Valchuk<h1>" > /var/www/html/index.html

    sudo service apache2 restart
}

if pgrep -x "apache2" >/dev/null
then
    echo "Server already installed"
else
    install_apache
fi