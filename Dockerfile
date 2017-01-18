FROM ubuntu:xenial

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        git \
        curl \
        build-essential \
        mysql-server \
        libmysqlclient-dev \
        qtbase5-dev \
        qt5-qmake \
        libqtwebkit-dev \
        xvfb \
        memcached \
        ca-certificates

RUN curl -sSL https://get.rvm.io | bash -s stable

RUN ["/bin/bash", "-l", "-c", "rvm requirements; rvm install 2.3.3; gem install bundler --no-ri --no-rdoc"]

RUN apt-get install bundler
