# =====================================
# title             : lamp.sh
# description       : Script que instala y configura LAMP de forma automatizada.
# author            : Carlos Hernandez Navarro
# date              : 29/10/2021
# version           : 1.0.8
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
cat > /etc/apache2/sites-available/$resp.conf << EOF
<VirtualHost *:80>
      ServerAdmin admin@$resp.com
      ServerName $resp.com
      ServerAlias www.$resp.com
      DocumentRoot /var/www/$resp

      ErrorLog ${APACHE_LOG_DIR}/error.log
      CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF
a2ensite $resp
systemctl restart apache2
apt install php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
service apache2 restart
