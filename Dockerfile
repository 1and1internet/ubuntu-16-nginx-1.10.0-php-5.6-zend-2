FROM 1and1internet/ubuntu-16-nginx-1.10.0-php-5.6
MAINTAINER james.wilkins@fasthosts.co.uk
ARG DEBIAN_FRONTEND=noninteractive
RUN \
  apt-get update && \
  apt-get install -y git && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/* && \
  chmod -R 777 /var/www && \
  cd /var/www && \
  cp /usr/local/bin/composer composer.phar . && \
  php composer.phar create-project -sdev --repository-url="https://packages.zendframework.com" zendframework/skeleton-application . && \
  mv html html_old && \
  mv public html
  