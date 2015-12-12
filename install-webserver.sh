#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y apache2 git php5 php5-curl

git clone https://github.com/grantngai/itmo-444-fall2015.git

mv ./itmo-444-fall2015/images /var/www/html/images
mv ./itmo-444-fall2015/*.html /var/www/html
mv ./itmo-444-fall2015/*.php /var/www/html

curl -sS https://getcomposer.org/installer | sudo php &> /tmp/getcomposer.txt

sudo php composer.phar require aws/aws-sdk-php &> /tmp/runcomposer.txt

sudo mv vendor /var/www/html &> /tmp/movecomposer.txt

sudo php /var/www/html/setup.php &> /tmp/database-setup.txt

echo "Hello!" > /tmp/hello.txt 
