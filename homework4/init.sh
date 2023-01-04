#!/bin/bash

sudo apt update -y

sudo apt install apache2 php libapache2-mod-php -y

sudo mkdir -p /var/www/html/

sudo echo "<h1>Created with  Terraform by Serhii Valchuk<h1>" > /var/www/html/index.html

sudo service apache2 restart


