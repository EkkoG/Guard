#!/bin/sh

latest_ips=$(tail -10 /usr/local/openresty/nginx/conf/ip_white.conf)
echo "$latest_ips" > /usr/local/openresty/nginx/conf/ip_white.conf
latest_ips2=$(tail -10 /usr/local/openresty/nginx/conf/ip_white2.conf)
echo "$latest_ips2" > /usr/local/openresty/nginx/conf/ip_white2.conf

/usr/bin/openresty -s reload