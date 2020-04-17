FROM webdevops/php-nginx-dev:7.3-alpine

ADD ./config-files/my-script.sh /usr/local/bin/
ADD ./config-files/migration-tasks.conf /opt/docker/etc/supervisor.d/
