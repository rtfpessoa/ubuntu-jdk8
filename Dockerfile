FROM library/ubuntu:14.04.3
MAINTAINER Rodrigo Fernandes <rodrigo.fernandes@tecnico.ulisboa.pt>

# Install and setup project dependencies
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y software-properties-common && \
  apt-get install -y curl unzip nano git && \
  rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US en_US.UTF-8

# Install Java 8
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  apt-get install -y oracle-java8-set-default && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

RUN echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

RUN echo "[core]" >> ~/.gitconfig
RUN echo "quotepath = false" >> ~/.gitconfig