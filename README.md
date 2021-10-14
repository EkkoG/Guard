Guard is a service to add white list access for other TLS or fake-TLS service.

Example usage, to protect [MTProxy](https://github.com/TelegramMessenger/MTProxy), cuase it is easy to be detected and be banned.

Also you can protect other service like Nginx webserver etc.

### Usage

Run the service, and open url http://ip:80/addip, your IP will be added to the whitelist, and you can access the protected service now.

### How to run

Create a `docker-compose.yml` file, put this to it

```
version: '3.5'
services:
  mtproxy-admin:
    build: .
    container_name: mtproxy-admin
    restart: always
    networks:
      xxx-com:
        aliases: 
          - internal-mtproxy-admin.xxx.com
    ports:
      - "6080:80"
      - "6443:443"
    volumes:
      - ./ip_white.conf:/usr/local/openresty/nginx/conf/ip_white.conf
    environment:
      - SERVICE_PROTECTED=internal-mtproxy.xxx.com:443
    


networks:
  xxx-com:
    name: xxx-com
```

The most important thing is, you must set a `SERVICE_PROTECTED` env to declare which service you need protect, it support both ip:port and domant:port format.

And if you want to persistent the white list, you should mount a file to `/usr/local/openresty/nginx/conf/ip_white.conf`


### TODO

[x] use non-root user to run nginx


### Thanks

https://www.nixops.me/articles/nignx-add-ip-whitelist-on-demand.html