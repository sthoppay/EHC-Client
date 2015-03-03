FROM ubuntu:latest
MAINTAINER Suresh.Thoppay@emc.com

WORKDIR /root

RUN apt-get update

RUN apt-get install -yq unzip \
            default-jre && \
            apt-get clean


#Download from https://vdc-download.vmware.com/vmwb-repository/dcr-public/e8b140e7-cf16-4ff6-af88-a22ad7e9f5d1/666dda17-ea48-4f93-8de0-224deebfc985/cloudclient-3.1.0-2375258-dist.zip

ADD cloudclient-3.1.0-2375258-dist.zip /tmp
RUN unzip /tmp/cloudclient-3.1.0-2375258-dist.zip -d /root
RUN rm -rf /tmp/cloudclient-3.1.0-2375258-dist.zip

RUN echo EULA=true >~/.cloudclient/cloudclient.config
CMD ["/root/cloudclient-3.1.0-2375258-dist/bin/cloudclient.sh"]
