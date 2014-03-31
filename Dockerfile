FROM ubuntu

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y wget openjdk-7-jre-headless
RUN mkdir -p /opt/zookeeper
RUN wget -q -O /opt/zookeeper/3.4.6.tar.gz http://apache.mirror.uber.com.au/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
RUN wget -q -O /opt/zookeeper/KEYS http://www.us.apache.org/dist/zookeeper/KEYS
RUN wget -q -O /opt/zookeeper/3.4.6.tar.gz.asc http://www.us.apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz.asc
RUN gpg --import /opt/zookeeper/KEYS
RUN gpg --verify /opt/zookeeper/3.4.6.tar.gz.asc
RUN tar -xzf /opt/zookeeper/3.4.6.tar.gz -C /opt/zookeeper/
ADD conf /opt/zookeeper/zookeeper-3.4.6/conf

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

USER daemon

EXPOSE 2181 2888 3888

ENTRYPOINT ["/opt/zookeeper/zookeeper-3.4.6/bin/zkServer.sh"]
CMD ["start-foreground"]

