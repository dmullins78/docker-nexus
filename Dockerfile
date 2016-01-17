FROM       java:8
MAINTAINER Dan Mullins <dmullins78@gmail.com>

ENV SONATYPE_WORK /sonatype-work
ENV NEXUS_VERSION 3.0.0-b2015110601
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

RUN mkdir -p /opt/sonatype/nexus \
      && curl -SL https://sonatype-download.global.ssl.fastly.net/nexus/oss/nexus-${NEXUS_VERSION}-bundle.tar.gz \
      | tar -xzC /opt/sonatype/nexus 

RUN useradd -r -u 200 -m -c "nexus role account" -d ${SONATYPE_WORK} -s /bin/false nexus

RUN chown nexus:nexus -R /opt/sonatype/nexus

VOLUME ${SONATYPE_WORK}

EXPOSE 8081
WORKDIR /opt/sonatype/nexus/nexus-${NEXUS_VERSION}
USER nexus

CMD bin/nexus 
