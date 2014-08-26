## Version 1.0.2
FROM debian:jessie
MAINTAINER Thomas Fritz <thomas.fritz@forty-two.io>

# First, update and upgrade all packages in our base-image. You should no do that for your actual running containers.
RUN DEBIAN_FRONTEND=noninteractive apt-get update -qqy > /dev/null 2>&1 && \
    DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -qqy > /dev/null 2>&1

# Generic UTF-8 locale
ENV LC_ALL C.UTF-8

# Common used and rarely changing package dependencies. locales package will also dpkg-reconfigure locales.
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy --no-install-recommends \
    make \
    locales \
    procps \
    gettext-base \
    curl \
    vim-tiny \
    > /dev/null 2>&1

RUN echo "Etc/UTC" > /etc/timezone && \
	DEBIAN_FRONTEND=noninteractive dpkg-reconfigure -f noninteractive tzdata > /dev/null 2>&1

RUN DEBIAN_FRONTEND=noninteractive apt-get autoclean -qqy > /dev/null 2>&1 && \
    DEBIAN_FRONTEND=noninteractive apt-get autoremove -qqy > /dev/null 2>&1

CMD ["echo","-e","Hi! :)\nSee https://github.com/fortytwoio/docker-base-image for more information and source of the Dockerfile."]
