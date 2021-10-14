#!/bin/sh
sed -i "s/SERVICE_PROTECTED/$SERVICE_PROTECTED/g" /usr/local/openresty/nginx/conf/nginx.conf
/usr/bin/openresty -g "daemon off;"