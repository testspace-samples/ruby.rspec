FROM ubuntu:xenial

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        nodejs \
        xvfb \
        build-essential \
        curl \
        git \
        libffi-dev \
        zlib1g-dev \
        libssl-dev \
        libreadline-dev \
        libyaml-dev \
        libxml2-dev \
        libxslt-dev \
        mysql-server \
        libmysqlclient-dev \
        qtbase5-dev \
        qt5-qmake \
        libqtwebkit-dev \
        xvfb \
        memcached \
        ca-certificates \
        firefox

RUN apt-get clean

# Install rbenv and ruby-build
RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN /root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'eval "$(rbenv init -)"' >> .bashrc

RUN rbenv install 2.3.3
RUN echo "gem: --no-document" > ~/.gemrc
RUN gem install bundler
