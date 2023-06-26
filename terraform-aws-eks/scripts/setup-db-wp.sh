#!/bin/sh

sleep 30
# Сreate a database
mysql -h $SERVER_NAME -u $USER_NAME -p$PASSWORD -P 3306 -e "\
   CREATE DATABASE IF NOT EXISTS WordPress; \
    USE WordPress; \
    CREATE TABLE IF NOT EXISTS TableforWP (id INT PRIMARY KEY, name VARCHAR(50)); \
    INSERT IGNORE INTO TableforWP (id, name) VALUES (1, 'John'), (2, 'Jeny'), (3, 'Jack');"     
sleep 10          
if [  -f /var/www/html/wp-config.php ]; then  
    wp --allow-root --path=/var/www/html plugin install contact-form-7 --activate && \
    wp --allow-root --path=/var/www/html theme install hestia    && \
    wp --allow-root --path=/var/www/html theme activate hestia     
else    
    # Configure WP-CLI and install plugins and themes
    # Replace with you dbpass, url, title, admin_user, admin_password, admin_email.
    # If you need any necessary themes or plugins replace them.
    wp core download --path=/var/www/html --allow-root && \
    wp --allow-root --path=/var/www/html config create \
      --dbhost=mysql \
      --dbname=WordPress \
      --dbuser=root \
      --dbpass=wordsec \
      --allow-root && \
    wp --allow-root --path=/var/www/html core install \
      --url=it-sproutdevteam.fun  \
      --title=WPsite \
      --admin_user=igorpost \  
      --admin_password=1991test \  
      --admin_email=igorpostavnichiy@gmail.com && \ #
    wp --allow-root --path=/var/www/html plugin install contact-form-7 --activate && \
    wp --allow-root --path=/var/www/html theme install twentytwentytwo  && \
    wp --allow-root --path=/var/www/html theme activate twentytwentytwo     
fi
