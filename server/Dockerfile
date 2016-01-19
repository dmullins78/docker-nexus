FROM       java:8
MAINTAINER Dan Mullins <dmullins78@gmail.com>

ENV NEXUS_VERSION 3.0.0-b2015110601
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV NEXUS_TGZ_URL=http://download.sonatype.com/nexus/oss/nexus-installer-3.0.0-m6-unix-archive.tar.gz

RUN mkdir -p /opt/sonatype/nexus \
      && curl -SL ${NEXUS_TGZ_URL} \ 
      | tar -xzC /opt/sonatype

COPY nexus.vmoptions /opt/sonatype/nexus-${NEXUS_VERSION}/bin/

EXPOSE 8081
WORKDIR /opt/sonatype/nexus-${NEXUS_VERSION}

CMD ["bin/nexus", "run"]
