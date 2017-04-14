FROM atlassian/default-image
MAINTAINER Adnene KHALFA<adnene.khalfa@gmail.com>

# Install dependencies
RUN apt-get update && apt-get install -y \
    --no-install-recommends

WORKDIR /opt
RUN wget http://download.redis.io/redis-stable.tar.gz && tar xvzf redis-stable.tar.gz

WORKDIR /opt/redis-stable
RUN make && sudo make install
COPY redis.conf /opt/redis-stable

COPY start.sh /sbin/start.sh
RUN chmod 755 /sbin/start.sh


# Define default command
ENTRYPOINT /sbin/start.sh && /bin/bash

# Expose ports.
EXPOSE 6379