echo "This script will set up nextcloud with Apache2 and mysql"
echo "To start please provide some details"
#ask for credentials for mysql
echo "this script will install and configure Mysql"
echo"please provide me the details for the mysql installation"

#download dependencies
sudo apt install apache2 libapache2-mod-php php mariadb-server -y
sudo apt install php-gd php-mysql php-curl php-json php-gmp php-bcmath php-xml php-mbstring php-intl php-imagick php-zip bzip2 -y

#download nextclod

#move to correct directory

#change permissions

#add trusted domains
