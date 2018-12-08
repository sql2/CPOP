###############################################################################
# Dockerfile to build Mariadb container images
# Based on Ubuntu 16.04
###############################################################################

# Set the base image to Ubuntu 16.04
FROM ubuntu:xenial

# File Author / Maintainer
MAINTAINER hyeongchae@gmail.com 

LABEL vendor="MySQL Korea User Group" \
      description="MySQL Server on Ubuntu Xenial" \
      version="5.7"

RUN sed -i 's/archive\.ubuntu/kr\.archive\.ubuntu/g' /etc/apt/sources.list

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y apt-utils curl tzdata vim unzip iputils-ping lsb-core

ADD https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 /usr/local/bin/
RUN chmod +x /usr/local/bin/jq-linux64 && \
    mv /usr/local/bin/jq-linux64 /usr/local/bin/jq

# -----------------------------------------------------------------------------
# Install MySQL Server
# -----------------------------------------------------------------------------
RUN apt-get install -y mysql-server-5.7 \
                       mysql-client-core-5.7 \
                       mysql-utilities

COPY my.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
RUN chown root:root /etc/mysql/mysql.conf.d/mysqld.cnf

# -----------------------------------------------------------------------------
# Install consul
# -----------------------------------------------------------------------------
ADD https://releases.hashicorp.com/consul/1.4.0/consul_1.4.0_linux_amd64.zip /root/
RUN unzip /root/consul_1.4.0_linux_amd64.zip -d /root/ && \
    rm -f /root/consul_1.4.0_linux_amd64.zip && \
    mv /root/consul /usr/local/bin/ && \
    mkdir -p /etc/consul.d/

COPY config.json /etc/consul.d/config.json

# -----------------------------------------------------------------------------
# Install pmm-client 
# -----------------------------------------------------------------------------
ADD https://repo.percona.com/apt/percona-release_0.1-9.xenial_all.deb /root/
RUN dpkg -i /root/percona-release_0.1-9.xenial_all.deb
RUN apt-get update && apt-get install -y pmm-client 

# -----------------------------------------------------------------------------
# Copy script utility
# -----------------------------------------------------------------------------
COPY entrypoint.sh /root/entrypoint.sh
COPY provisioning.sh /root/provisioning.sh
RUN chmod a+x /root/entrypoint.sh
RUN chmod a+x /root/provisioning.sh

# -----------------------------------------------------------------------------
# Clear
# -----------------------------------------------------------------------------
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

############################## INSTALLATION END ###############################

# Expose the default http port
EXPOSE 3306

# Start service on run container
ENTRYPOINT ["/root/entrypoint.sh"]
