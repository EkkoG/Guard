FROM openresty/openresty:1.19.9.1-2-buster

COPY mime.types /etc/nginx/mime.types
COPY cmd.sh /usr/local/bin/cmd.sh
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/local/openresty/nginx/html
COPY ngx_add.sh /opt/ngx_add.sh

CMD ["/usr/local/bin/cmd.sh"]

# Use SIGQUIT instead of default SIGTERM to cleanly drain requests
# See https://github.com/openresty/docker-openresty/blob/master/README.md#tips--pitfalls
STOPSIGNAL SIGQUIT