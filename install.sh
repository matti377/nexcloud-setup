echo "This script will set up nextcloud with Apache2 and mysql"
echo "To start please provide some details"
#ask for credentials for mysql
echo "this script will install and configure Mysql"
echo"please provide me the details for the mysql installation"

#download dependencies
sudo apt install apache2 libapache2-mod-php php mariadb-server -y
sudo apt install php-gd php-mysql php-curl php-json php-gmp php-bcmath php-xml php-mbstring php-intl php-imagick php-zip bzip2 -y

#configur php
sudo nano /etc/php/7.4/apache2/php.ini
change to memory_limit = 512M
sudo systemctl restart apache2

#configure Mysql
sudo mysql -u root -p
CREATE DATABASE nextcloud_db;
GRANT ALL ON nextcloud_db.* to 'nextcloud_user'@'localhost' IDENTIFIED BY 'userpassword';
FLUSH PRIVILEGES;
exit;

#download nextclod
wget https://download.nextcloud.com/server/releases/latest.zip
sudo unzip nextcloud-21.0.1.zip -d /var/www/html/
sudo rm nexcloud
sudo chown -R www-data:www-data /var/www/html/nextcloud
sudo chmod -R 775 /var/www/html/nextcloud
#move to correct directory
sudo vim /etc/apache2/sites-available/nextcloud.conf
sudo a2ensite nextcloud.conf
sudo systemctl reload apache2
#add trusted domains
echo "DO you want to acces you nexcloud by an domain? (Y|n)"
# set up removal script
sudo mv remove.sh /
sudo chmod +x /remove.sh
#finish
echo "Nexcloud is insalled and running"
echo "visit http://$server_ip to configure nexcloud"
echo "execute the following command to free up space"
echo "sh /remove.sh"

