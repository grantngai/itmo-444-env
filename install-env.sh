sudo apt-get update -y
sudo apt-get install -y apache2 git

git clone http://github.com/grantngai/itmo-444-fall2015.git

mv ./itmo-444-fall2015/images /var/www/html/images
mv ./itmo-444-fall2015/*.html /var/www/html
mv ./itmo-444-fall2015/*.php /var/www/html

echo "Hello!" > /tmp/hello.txt 
