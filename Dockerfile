FROM       java:8
MAINTAINER Dan Mullins <dmullins78@gmail.com>

ENV SONATYPE_WORK /sonatype-work
ENV NEXUS_VERSION 3.0.0-b2015110601
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV NEXUS_TGZ_URL=http://download.sonatype.com/nexus/oss/nexus-installer-3.0.0-m6-unix-archive.tar.gz

RUN mkdir -p /opt/sonatype/nexus \
      && curl -SL ${NEXUS_TGZ_URL} \ 
      | tar -xzC /opt/sonatype

COPY nexus.vmoptions /opt/sonatype/nexus-${NEXUS_VERSION}/bin/

RUN useradd -r -u 200 -m -c "nexus role account" -d ${SONATYPE_WORK} -s /bin/false nexus

RUN chown nexus:nexus -R /opt/sonatype

VOLUME ${SONATYPE_WORK}

EXPOSE 8081
WORKDIR /opt/sonatype/nexus-${NEXUS_VERSION}
USER nexus

CMD ["bin/nexus", "run"]
