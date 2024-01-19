#!/usr/bin/python3
# Install Nginx if not already installed
sudo apt-get update
sudo apt-get -y install nginx

# Create necessary folders if they don't exist
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/

# Create a fake HTML file
echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" | sudo tee /data/web_static/releases/test/index.html

# Create symbolic link (remove and recreate if exists)
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current

# Give ownership of /data/ to ubuntu user and group (recursive)
sudo chown -R ubuntu:ubuntu /data/

# Update Nginx configuration
config_content="location /hbnb_static {
    alias /data/web_static/current/;
}
"
echo "$config_content" | sudo tee /etc/nginx/sites-available/default

# Restart Nginx
sudo service nginx restart

exit 0

