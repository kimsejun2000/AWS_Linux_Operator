#!/bin/bash

# Wordpress 초기화
yum update -y
yum install -y httpd24 php70 php70-mysqlnd
chkconfig httpd on

# Wordpress 다운로드 및 설정
cd /tmp
curl -O https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
touch /tmp/wordpress/.htaccess
chmod 660 /tmp/wordpress/.htaccess
cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
mkdir /tmp/wordpress/wp-content/upgrade

sed -i -e '83a\\' /tmp/wordpress/wp-config.php
sed -i -e '84a\\define("FS_METHOD", "direct");' /tmp/wordpress/wp-config.php
sed -i -e '85a\\define("WP_HOME", "http://". filter_input(INPUT_SERVER, "HTTP_HOST", FILTER_SANITIZE_STRING));' /tmp/wordpress/wp-config.php
sed -i -e '86a\\define("WP_SITEURL", "http://". filter_input(INPUT_SERVER, "HTTP_HOST", FILTER_SANITIZE_STRING));' /tmp/wordpress/wp-config.php
sed -i -e '87a\\define("WP_CONTENT_URL", "/wp-content");' /tmp/wordpress/wp-config.php
sed -i -e '88a\\define("DOMAIN_CURRENT_SITE", filter_input(INPUT_SERVER, "HTTP_HOST", FILTER_SANITIZE_STRING));' /tmp/wordpress/wp-config.php
sed -i -e '89a\\' /tmp/wordpress/wp-config.php
sed -i -e '90a\\' /tmp/wordpress/wp-config.php

# Wordpress 복사
rm -rf /var/www/html
sudo cp -a /tmp/wordpress/. /var/www/html

# Wordpress 권한 수정
usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www
chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
service httpd start