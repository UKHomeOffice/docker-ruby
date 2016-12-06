FROM quay.io/ukhomeofficedigital/centos-base

ENV RUBY_VERSION 2.3.3

# Onbuild commands ensure packages are updated whenever an image is built on top of this one
ONBUILD RUN yum clean all && \
            yum update -y && \
            yum install -y git && \
            yum clean all && \
            rpm --rebuilddb
ONBUILD ADD Gemfile /app
ONBUILD RUN bundle install
ONBUILD ADD . /app

RUN yum install -y wget make bzip2 gcc-c++

#   Install Ruby
RUN \
#   Get GPG key
    wget https://raw.github.com/postmodern/postmodern.github.io/master/postmodern.asc && \
    gpg --import postmodern.asc && \
    wget https://raw.github.com/postmodern/ruby-install/master/pkg/ruby-install-0.6.0.tar.gz.asc && \
#   Download ruby-install and verify against the GPG key
    wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz && \
    gpg --verify ruby-install-0.6.0.tar.gz.asc ruby-install-0.6.0.tar.gz && \
    tar -xzvf ruby-install-0.6.0.tar.gz && cd ruby-install-0.6.0 && make install && \
#    Install Ruby
    ruby-install --system ruby 2.2.6 && gem install bundler

#Create app user and group
RUN groupadd -r app && \
    useradd -r -g app app -d /app && \
    mkdir -p /app && \
    chown -R app:app /app

WORKDIR /app
