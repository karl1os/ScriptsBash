# =====================================
# title             : lamp.sh
# description       : Script que instala y configura LAMP de forma automatizada.
# author            : Carlos Hernandez Navarro
# date              : 29/10/2021
# version           : 1.0.0
# =====================================
#!/bin/bash
echo "que nombre quieres para la web?"
read resp
apt update
apt upgrade -y
apt install apache2 -y
a2enmod rewrite
systemctl restart apache2
apt install mysql-server -y
ufw allow in "Apache Full"
mkdir -p /var/www/$resp
chown -R $USER:$USER /var/www/$resp
chmod -R 755 /var/www/$resp
touch /etc/apache2/sites-available/$resp.conf
echo "<VirtualHost *:80>" > etc/apache2/sites-available/$resp.conf
echo "      ServerAdmin admin@$resp.com" >> etc/apache2/sites-available/$resp.conf
echo "      ServerName $resp.com" >> etc/apache2/sites-available/$resp.conf
echo "      ServerAlias www.$resp.com" >> etc/apache2/sites-available/$resp.conf
echo "      DocumentRoot /var/www/$resp" >> etc/apache2/sites-available/$resp.conf
echo >> etc/apache2/sites-available/$resp.conf
echo "      ErrorLog ${APACHE_LOG_DIR}/error.log" >> etc/apache2/sites-available/$resp.conf
echo "      CustomLog ${APACHE_LOG_DIR}/access.log combined" >> etc/apache2/sites-available/$resp.conf
echo "</VirtualHost>" >> etc/apache2/sites-available/$resp.conf
a2ensite $resp
systemctl restart apache2
apt install php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
service apache2 restart
mysql_secure_installation
