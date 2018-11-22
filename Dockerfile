FROM jordan/icinga2


RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise-security main restricted universe multiverse" >> /etc/apt/sources.list

RUN apt-get update -y
RUN apt-get install vim git -y
RUN cd /tmp && wget https://sourceforge.net/projects/nagvis/files/NagVis%201.8/nagvis-1.8.tar.gz
RUN cd /tmp && tar zxvf nagvis-1.8.tar.gz

# RUN cd /usr/share/icingaweb2/modules && git clone https://github.com/Icinga/icingaweb2-module-nagvis.git nagvis-sys
# RUN icingacli module enable nagvis-sys



# RUN cd /usr/share/icingaweb2/modules
# RUN git clone https://github.com/Icinga/icingaweb2-module-nagvis.git nagvis

# ENTRYPOINT ["/opt/run"]