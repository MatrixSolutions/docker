FROM java:openjdk-8-jre

# NOTICE: This file was changed from the original, spotify version

RUN apt-get update && apt-get install -y zookeeper wget supervisor dnsutils

ADD http://apache.claz.org/kafka/0.10.0.0/kafka_2.11-0.10.0.0.tgz /opt/kafka.tgz

RUN tar xfz /opt/kafka.tgz -C /opt
RUN rm /opt/kafka.tgz

RUN mv /opt/kafka_2.11-0.10.0.0 /opt/kafka

ADD start-kafka.sh /usr/bin/start-kafka.sh

ADD kafka.conf zookeeper.conf /etc/supervisor/conf.d/

ENV ZOOKEEPER_HOST localhost
ENV ZOOKEEPER_PORT 2181
ENV KAFKA_HOST localhost
ENV KAFKA_PORT 9092
ENV SECURITY_PROTOCOL PLAINTEXT

EXPOSE 2181 9092

CMD ["supervisord", "-n"]
