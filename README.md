Guard is a service to add white list access for other TLS or fake-TLS services.

Example usage, to protect [MTProxy](https://github.com/TelegramMessenger/MTProxy), cause it is easy to be detected and be banned.

Also, you can protect another service like Nginx web server, etc.

### Usage

Run the service, and open URL http://ip:80/addip, your IP will be added to the whitelist, and you can access the protected service now.

### How to run

Create a `docker-compose.yml` file, put this to it

```
version: '3.5'
services:
  mtproxy-admin:
    image: ghcr.io/cielpy/guard:master
    container_name: mtproxy-admin
    restart: always
    ports:
      - "6080:80"
      - "6443:443"
    volumes:
      - ./ip_white.conf:/usr/local/openresty/nginx/conf/ip_white.conf
    environment:
      - SERVICE_PROTECTED=internal-mtproxy.xxx.com:443
```

The most important thing is, you must set a `SERVICE_PROTECTED` env to declare which service you need to protect, it supports both ip:port and domant:port format.

And if you want to persistent the white list, you should mount a file to `/usr/local/openresty/nginx/conf/ip_white.conf`

### Clean IP

If you want to clean IP in whitelist, run script in the container, like this

```
docker exec -ti container-name /opt/clean_ips.sh
```

I personally would add it to cron job.

### TODO

- [ ] use non-root user to run Nginx


### Thanks

https://www.nixops.me/articles/nignx-add-ip-whitelist-on-demand.html
