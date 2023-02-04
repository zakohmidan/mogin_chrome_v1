# Great stuff taken from: https://github.com/rastasheep/ubuntu-sshd

#FROM ubuntu:18.04
FROM debian:bullseye

#FROM ubuntu:20.04
MAINTAINER 0x##Y8H4 Diklic "https://github.com/rastasheep"

###########################################################################-+
RUN echo $V1_NGROK_TOKENS $key002 $Environment_KEY_VAULT $key1
ENV DISPLAY=:1 \
    NGROK_TOKENS=257VWvy4O16qLnlACoOGlAu69zH_4aaxZwYFpd7YxxeN6RY4W\
    google_main=bigoctbig\
    VNC_PORT=5901 \
    NO_VNC_PORT=6901 \
    NO_VNC_PORT_A=6080 \
    SSH_PORT=22 \
    US_PS=azer \
    SUPER_VISOR__PORT=9001 \
    DEBIAN_FRONTEND=noninteractive
    
###########################################################################
RUN echo ${V1_NGROK_TOKENS}
RUN echo $V1_NGROK_TOKENS
RUN echo $NGROK_TOKENS
ENV HOME=/headless \
    TERM=xterm \
    STARTUPDIR=/dockerstartup \
    VNC_VIEW_ONLY=false
    
###########################################################################

COPY ./payload/* "${STARTUPDIR}"/
RUN find $STARTUPDIR -name '*.sh' -exec chmod a+x {} +


RUN apt-get update < /dev/null > /dev/null
###########################################################################
RUN apt-get  install -y apt-utils openssh-server htop wget < /dev/null > /dev/null

###########################################################################
RUN $STARTUPDIR/step_1.sh
RUN $STARTUPDIR/step_2.sh
RUN $STARTUPDIR/ng.sh

###########################################################################
ADD ./etc/ /etc/

RUN mkdir /var/run/sshd

RUN useradd --user-group --create-home --system mogenius

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



# PLEASE CHANGE THAT AFTER FIRST LOGIN
RUN echo 'mogenius:mogenius' | chpasswd
RUN echo "PLEASE CHANGE THAT AFTER FIRST LOGIN"
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 test 

RUN  echo 'root:ooop' | chpasswd

RUN service ssh start
EXPOSE 22 9001 9002
CMD ["/usr/sbin/sshd", "-D", "-e"]
CMD [ "/usr/bin/supervisord", "-n" , "-c","/etc/supervisor/supervisord.conf" ]

