FROM quay.io/ukhomeofficedigital/centos-base

ENV RUBY_VERSION 2.3.0

RUN yum clean all && \
    yum update -y && \
# Install all packages required by RVM
    yum install -y which patch libyaml-devel \
    glibc-headers autoconf gcc-c++ glibc-devel \
    patch readline-devel zlib-devel libffi-devel \
    openssl-devel make bzip2 automake libtool \
    bison sqlite-devel && \
    yum clean all && \
    rpm --rebuilddb

#Install RVM with latest stable ruby and bundle
RUN curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -  && \
    /usr/bin/curl -L https://get.rvm.io | /bin/bash -s stable --ruby \
    --with-default-gems="bundle"

#Create app user and group
RUN groupadd -r app && \
    useradd -r -g app app -d /app && \
    mkdir -p /app && \
    chown -R app:app /app

ENV GEM_PATH=/usr/local/rvm/gems/ruby-${RUBY_VERSION}:/usr/local/rvm/gems/ruby-${RUBY_VERSION}@global \
    RUBY_VERSION=ruby-${RUBY_VERSION} \
    GEM_HOME=/usr/local/rvm/gems/ruby-${RUBY_VERSION} \
    PATH=${PATH}:/usr/local/rvm/rubies/ruby-${RUBY_VERSION}/bin:/usr/local/rvm/gems/ruby-${RUBY_VERSION}/bin:/usr/local/rvm/gems/ruby-${RUBY_VERSION}@global/bin

WORKDIR /app
