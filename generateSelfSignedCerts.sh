#!/bin/bash
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./ssl/private/localhost.key -out ./ssl/certs/localhost.crt -config ./ssl/localhost.conf
