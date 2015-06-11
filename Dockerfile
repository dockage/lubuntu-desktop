FROM ubuntu:15.04
MAINTAINER Mohammad Abdoli Rad <m.abdolirad@gmail.com>

RUN apt-get update \
 && apt-get install -y supervisor logrotate git tightvncserver openssh-server \ 
	lubuntu-desktop lxterminal firefox \ 
 && rm -rf /var/lib/apt/lists/*

COPY assets/install /opt/install
RUN chmod 755 /opt/install
RUN /opt/install

COPY assets/init /opt/init
RUN chmod 755 /opt/init

VOLUME ["/home/vnc/data"]

ENTRYPOINT ["/opt/init"]
CMD ["start"]

EXPOSE 22 5901
