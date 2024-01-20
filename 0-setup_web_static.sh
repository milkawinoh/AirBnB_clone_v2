#!/usr/bin/env bash
# Script to set up web servers for the deployment of web_static

# Update and install Nginx
sudo apt-get update
sudo apt-get -y install nginx
sudo ufw allow 'Nginx HTTP'

# Create directory structure
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/
sudo touch /data/web_static/releases/test/index.html

# Create HTML content for the test page
sudo tee /data/web_static/releases/test/index.html > /dev/null <<EOF
<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>
EOF

# Create symbolic link
sudo ln -s -f /data/web_static/releases/test/ /data/web_static/current

# Set ownership
sudo chown -R ubuntu:ubuntu /data/

# Update Nginx configuration
sudo sed -i '/listen 80 default_server/a location /hbnb_static { alias /data/web_static/current/;}' /etc/nginx/sites-enabled/default

# Restart Nginx
sudo service nginx restart

