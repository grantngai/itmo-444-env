#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y apache2 git php5 php5-curl mysql-client curl php5-mysql php5-imagick

git clone https://github.com/grantngai/itmo-444-fall2015.git

mv ./itmo-444-fall2015/images /var/www/html/images
mv ./itmo-444-fall2015/*.html /var/www/html
mv ./itmo-444-fall2015/*.php /var/www/html

curl -sS https://getcomposer.org/installer | sudo php &> /tmp/getcomposer.txt

sudo php composer.phar require aws/aws-sdk-php &> /tmp/runcomposer.txt

sudo mv vendor /var/www/html &> /tmp/movecomposer.txt

sudo php /var/www/html/setup.php &> /tmp/database-setup.txt

echo "Hello!" > /tmp/hello.txt

ARN=(`aws sns create-topic --name itmo444mp2`)

aws sns set-topic-attributes --topic-arn $ARN --attribute-name DisplayName --attribute-value itmo444mp2

aws sns subscribe --topic-arn $ARN --protocol sms --notification-endpoint 17085439859

aws sns publish --topic-arn $ARN --message "Hello Grant"  
