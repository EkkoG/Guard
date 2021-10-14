#!/bin/sh

ngx_conf=/usr/local/openresty/nginx/conf/ip_white.conf
result=`cat $ngx_conf | grep $1`
if [ -z "$result" ]; then
    echo "$1 1;" >> $ngx_conf
    /usr/bin/openresty -s reload
else
    exit 0
fi