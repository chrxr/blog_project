#!/bin/sh
sudo service nginx stop
./letsencrypt-auto certonly -a webroot --webroot-path=/usr/share/nginx/html -d chrxr.com -d www.chrxr.com
sudo service nginx start
