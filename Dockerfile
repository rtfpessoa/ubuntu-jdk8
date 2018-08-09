FROM library/ubuntu:16.04
MAINTAINER Rodrigo Fernandes <rodrigo.fernandes@tecnico.ulisboa.pt>

#
# Ubuntu with Oracle JDK 8
#

RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN \
  apt-get -y update && \
  apt-get -y install software-properties-common && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  add-apt-repository -y ppa:git-core/ppa && \
  apt-get -y update && \
  apt-get -y upgrade && \
  apt-get -y install curl wget unzip nano && \
  apt-get -y install git=1:2.17.* && \
  apt-get -y install oracle-java8-installer && \
  apt-get -y install oracle-java8-unlimited-jce-policy && \
  apt-get -y install oracle-java8-set-default && \
  rm -rf \
        ${JAVA_HOME}/*/javaws \
        ${JAVA_HOME}/*/jjs \
        ${JAVA_HOME}/*/keytool \
        ${JAVA_HOME}/*/orbd \
        ${JAVA_HOME}/*/pack200 \
        ${JAVA_HOME}/*/policytool \
        ${JAVA_HOME}/*/rmid \
        ${JAVA_HOME}/*/rmiregistry \
        ${JAVA_HOME}/*/servertool \
        ${JAVA_HOME}/*/tnameserv \
        ${JAVA_HOME}/*/unpack200 \
        ${JAVA_HOME}/*/*javafx* \
        ${JAVA_HOME}/*/*jfx* \
        ${JAVA_HOME}/*/amd64/libdecora_sse.so \
        ${JAVA_HOME}/*/amd64/libfxplugins.so \
        ${JAVA_HOME}/*/amd64/libglass.so \
        ${JAVA_HOME}/*/amd64/libgstreamer-lite.so \
        ${JAVA_HOME}/*/amd64/libjavafx*.so \
        ${JAVA_HOME}/*/amd64/libjfx*.so \
        ${JAVA_HOME}/*/amd64/libprism_*.so \
        ${JAVA_HOME}/*/deploy* \
        ${JAVA_HOME}/*/desktop \
        ${JAVA_HOME}/*/ext/jfxrt.jar \
        ${JAVA_HOME}/*/ext/nashorn.jar \
        ${JAVA_HOME}/*/javaws.jar \
        ${JAVA_HOME}/*/jfr \
        ${JAVA_HOME}/*/jfr.jar \
        ${JAVA_HOME}/*/missioncontrol \
        ${JAVA_HOME}/*/oblique-fonts \
        ${JAVA_HOME}/*/plugin.jar \
        ${JAVA_HOME}/*/visualvm \
        ${JAVA_HOME}/man \
        ${JAVA_HOME}/plugin \
        ${JAVA_HOME}/*.txt \
        ${JAVA_HOME}/*/*/javaws \
        ${JAVA_HOME}/*/*/jjs \
        ${JAVA_HOME}/*/*/keytool \
        ${JAVA_HOME}/*/*/orbd \
        ${JAVA_HOME}/*/*/pack200 \
        ${JAVA_HOME}/*/*/policytool \
        ${JAVA_HOME}/*/*/rmid \
        ${JAVA_HOME}/*/*/rmiregistry \
        ${JAVA_HOME}/*/*/servertool \
        ${JAVA_HOME}/*/*/tnameserv \
        ${JAVA_HOME}/*/*/unpack200 \
        ${JAVA_HOME}/*/*/*javafx* \
        ${JAVA_HOME}/*/*/*jfx* \
        ${JAVA_HOME}/*/*/amd64/libdecora_sse.so \
        ${JAVA_HOME}/*/*/amd64/libfxplugins.so \
        ${JAVA_HOME}/*/*/amd64/libglass.so \
        ${JAVA_HOME}/*/*/amd64/libgstreamer-lite.so \
        ${JAVA_HOME}/*/*/amd64/libjavafx*.so \
        ${JAVA_HOME}/*/*/amd64/libjfx*.so \
        ${JAVA_HOME}/*/*/amd64/libprism_*.so \
        ${JAVA_HOME}/*/*/deploy* \
        ${JAVA_HOME}/*/*/desktop \
        ${JAVA_HOME}/*/*/ext/jfxrt.jar \
        ${JAVA_HOME}/*/*/ext/nashorn.jar \
        ${JAVA_HOME}/*/*/javaws.jar \
        ${JAVA_HOME}/*/*/jfr \
        ${JAVA_HOME}/*/*/jfr \
        ${JAVA_HOME}/*/*/jfr.jar \
        ${JAVA_HOME}/*/*/missioncontrol \
        ${JAVA_HOME}/*/*/oblique-fonts \
        ${JAVA_HOME}/*/*/plugin.jar \
        ${JAVA_HOME}/*/*/visualvm \
        ${JAVA_HOME}/*/man \
        ${JAVA_HOME}/*/plugin \
        ${JAVA_HOME}/*.txt && \
        rm -rf /root/.cache && \
        apt-get purge -y $(apt-cache search '~c' | awk '{ print $2 }') && \
        apt-get -y autoremove && \
        apt-get -y autoclean && \
        apt-get -y clean all && \
        sudo rm -rf /var/lib/apt/lists/* && \
        sudo rm -rf /var/cache/apt && \
        sudo rm -rf /var/cache/oracle-jdk8-installer && \
        sudo rm -rf /tmp/*
