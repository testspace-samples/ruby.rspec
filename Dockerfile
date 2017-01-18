FROM ruby:2.3.3

RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository ppa:ubuntu-mozilla-security/ppa
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        nodejs \
        xvfb \
        firefox
