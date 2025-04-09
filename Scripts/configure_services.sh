#!/bin/bash

echo "Configuring gunicorn systemd service..."
sudo cp /home/ubuntu/Scripts/gunicorn.service /etc/systemd/system/gunicorn.service
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable gunicorn
sudo systemctl restart gunicorn

echo "Configuring nginx..."
sudo cp /home/ubuntu/Scripts/nginx_app /etc/nginx/sites-available/myapp
sudo ln -sf /etc/nginx/sites-available/myapp /etc/nginx/sites-enabled
sudo rm -f /etc/nginx/sites-enabled/default
sudo nginx -t && sudo systemctl restart nginx
