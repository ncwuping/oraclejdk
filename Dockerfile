FROM centos:7

RUN yum clean all -y && yum makecache fast && yum update -y \
 && yum install -y epel-release \
 && yum clean all -y \
 && rm -rf /var/cache/yum

ENV JAVA_VERSION 1.8.0_202-b08

RUN set -eux; \
    JAVA_PKG="jdk-8u202-linux-x64.rpm"; \
    JAVA_URL="https://download.oracle.com/otn-pub/java/jdk/8u202-b08/1961070e4c9b4e26a04e7f5a083f551e/${JAVA_PKG}"; \
    curl -s -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" -O ${JAVA_URL}; \
    yum localinstall -y ${JAVA_PKG}; \
    rm -f ${JAVA_PKG};

ENV JAVA_HOME=/usr/java/default/jre \
    PATH=/usr/java/default/bin:$PATH
