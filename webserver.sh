#!/bin/bash
yum update -y
yum install httpd -y
yum install git -y
amazon-linux-extras install epel
yum install epel-release
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
yum install -y php70 php70-php php70-php-fpm php70-php-pecl-memcached php70-php-mysqlnd php70-php-xml
ln -s /usr/bin/php70 /usr/bin/php
service httpd start
chkconfig httpd on


NameVirtualHost *:81
<VirtualHost *:81>
    DocumentRoot /var/www/html/xuandieucicd/
    <Directory "/var/www/html/xuandieucicd">
      Order deny,allow
      Allow from all
      AllowOverride All
      Require all granted
   </Directory>
</VirtualHost>

ssh -T -i ]/home/jenkins/key_web.pem www-user@3.86.230.98 << EOF
cd /var/www/html/xuandieucicd
git pull
EOF
