FROM hurricane/dockergui:x11rdp1.3
MAINTAINER tobbenb <torbjornbrekke@gmail.com>

# User/Group Id gui app will be executed as
ENV USER_ID="99" GROUP_ID="100" APP_NAME="Gourmet" TERM="xterm" WIDTH="1280" HEIGHT="720"

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

RUN apt-get update -qq
RUN apt-get install gourmet -qy

# Install MakeMKV
ADD ./files/startapp.sh /startapp.sh
RUN chmod +x /startapp.sh


VOLUME ["/config"]
EXPOSE 3389 8080
