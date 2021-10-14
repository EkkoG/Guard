#!/bin/sh
if [ ! -f /usr/local/openresty/nginx/conf/ip_white.conf ]; then
    echo "" > /usr/local/openresty/nginx/conf/ip_white.conf
fi
sed -i "s/SERVICE_PROTECTED/$SERVICE_PROTECTED/g" /usr/local/openresty/nginx/conf/nginx.conf
/usr/bin/openresty -g "daemon off;"