FROM library/ubuntu:14.04.3
MAINTAINER Rodrigo Fernandes <rodrigo.fernandes@tecnico.ulisboa.pt>

#
# Ubuntu with Oracle JDK 8
#

RUN locale-gen en_US en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Install and setup project dependencies
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get -y update && \
  apt-get -y upgrade && \
  apt-get -y install software-properties-common && \
  apt-get -y install curl wget unzip nano git && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get -y update && \
  apt-get -y install oracle-java8-installer && \
  apt-get -y install oracle-java8-set-default && \
  rm -rf $JAVA_HOME/lib/missioncontrol \
        $JAVA_HOME/lib/visualvm \
        $JAVA_HOME/lib/*javafx* \
        $JAVA_HOME/jre/lib/plugin.jar \
        $JAVA_HOME/jre/lib/ext/jfxrt.jar \
        $JAVA_HOME/jre/bin/javaws \
        $JAVA_HOME/jre/lib/javaws.jar \
        $JAVA_HOME/jre/lib/desktop \
        $JAVA_HOME/jre/plugin \
        $JAVA_HOME/jre/lib/deploy* \
        $JAVA_HOME/jre/lib/*javafx* \
        $JAVA_HOME/jre/lib/*jfx* \
        $JAVA_HOME/jre/lib/amd64/libdecora_sse.so \
        $JAVA_HOME/jre/lib/amd64/libprism_*.so \
        $JAVA_HOME/jre/lib/amd64/libfxplugins.so \
        $JAVA_HOME/jre/lib/amd64/libglass.so \
        $JAVA_HOME/jre/lib/amd64/libgstreamer-lite.so \
        $JAVA_HOME/jre/lib/amd64/libjavafx*.so \
        $JAVA_HOME/jre/lib/amd64/libjfx*.so && \
  rm -rf $JAVA_HOME/jre/bin/jjs \
        $JAVA_HOME/jre/bin/keytool \
        $JAVA_HOME/jre/bin/orbd \
        $JAVA_HOME/jre/bin/pack200 \
        $JAVA_HOME/jre/bin/policytool \
        $JAVA_HOME/jre/bin/rmid \
        $JAVA_HOME/jre/bin/rmiregistry \
        $JAVA_HOME/jre/bin/servertool \
        $JAVA_HOME/jre/bin/tnameserv \
        $JAVA_HOME/jre/bin/unpack200 \
        $JAVA_HOME/jre/lib/ext/nashorn.jar \
        $JAVA_HOME/jre/lib/jfr.jar \
        $JAVA_HOME/jre/lib/jfr \
        $JAVA_HOME/jre/lib/oblique-fonts && \
    apt-get -y clean && \
    apt-get -y autoclean && \
    apt-get -y autoremove && \
    apt-get purge -y $(apt-cache search '~c' | awk '{ print $2 }') && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt && \
    rm -rf /var/cache/oracle-jdk8-installer && \
    rm -rf /tmp/*
