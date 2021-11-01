#!/bin/sh

latest_ips=$(tail -10 /usr/local/openresty/nginx/conf/ip_white.conf)
echo "$latest_ips" > /usr/local/openresty/nginx/conf/ip_white.conf

/usr/bin/openresty -s reload