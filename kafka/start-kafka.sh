#!/bin/sh

# NOTICE: This file was changed from the original, spotify version

LISTENERS="$SECURITY_PROTOCOL://$KAFKA_HOST:$KAFKA_PORT"
ZOOKEEPER="$ZOOKEEPER_HOST:$ZOOKEEPER_PORT"

echo "Kafka listeners config: $LISTENERS"
sed -r -i "s@#listeners=PLAINTEXT://:9092@listeners=$LISTENERS@" /opt/kafka/config/server.properties

echo "Zookeeper connection: $ZOOKEEPER"
sed -r -i "s@zookeeper.connect=localhost:2181@zookeeper.connect=$ZOOKEEPER@" /opt/kafka/config/server.properties

sed -r -i "s@clientPort=2181@clientPort=$ZOOKEEPER_PORT@" /opt/kafka/config/zookeeper.properties

/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties
