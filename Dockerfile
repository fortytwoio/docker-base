FROM debian:jessie
MAINTAINER Thomas Fritz <thomas.fritz@forty-two.io>

# First, update all packages in our base-image. You should no do that for your actual running containers.
RUN apt-get update -qq && apt-get upgrade -qqy

# Allow usage of apt-utils in later installs, so we use a seperate step
RUN apt-get install -qqy --no-install-recommends apt-utils

# Common used and rarely changing package dependencies
RUN apt-get install -qqy --no-install-recommends \
	software-properties-common \
  build-essential \
  make \
  gcc \
  locales

RUN dpkg-reconfigure -f noninteractive locales && \
  locale-gen C.UTF-8 && \
  /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8

# Install some more commonly used packages we might want to use
RUN apt-get install -qqy --no-install-recommends \
	git \
	gettext-base \
	htop \
	wget \
	curl \
	vim

RUN echo "Etc/UTC" > /etc/timezone && \
	dpkg-reconfigure -f noninteractive tzdata

