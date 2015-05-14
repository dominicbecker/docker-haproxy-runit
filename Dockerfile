FROM haproxy:1.5.12
MAINTAINER Dominic Becker <dominic.r.becker@gmail.com>

RUN apt-get update

# runit services
RUN apt-get install -yqq runit=2.1.*
ADD sv /etc/service
RUN find /etc/service -type f -exec chmod u+x {} \;

# start services in /etc/service
CMD /usr/sbin/runsvdir-start
