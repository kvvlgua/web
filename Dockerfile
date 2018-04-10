FROM debian:stretch
MAINTAINER Viktor Kolos

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        ca-certificates \
        nginx-extras \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/sites-enabled/default
COPY index.html /var/www/html/index.html

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
