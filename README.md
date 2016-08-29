# docker-kafka
---
A Kafka 0.10.0.0/Zookeeper docker image based on [spotify/docker-kafka](https://github.com/spotify/docker-kafka)

# NOTICE
---
This file was changed from the original, spotify version

This repository provides everything you need to run Kafka in Docker.

Why?
---
The main hurdle of running Kafka in Docker is that it depends on Zookeeper.
Compared to other Kafka docker images, this one runs both Zookeeper and Kafka
in the same container. This means:

* No dependency on an external Zookeeper host, or linking to another container
* Zookeeper and Kafka are configured to work together out of the box

Run/Testing it out
---

Run the docker image with the name "kafka"
```bash
docker run --name kafka -it matrixsolutions/kafka:0.10.0.0
```

Create a `test` topic
```bash
docker exec -it kafka /opt/kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
```

Startup a console consumer
```bash
docker exec -it kafka /opt/kafka/bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic test --from-beginning
```

In a new terminal, startup a console producer
```bash
docker exec -it kafka /opt/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test
```

Now, anything you type into the producer should appear in the consumer.

In the box
---
* **spotify/kafka**

  The docker image with both Kafka and Zookeeper. Built from the `kafka`
  directory.

Public Builds
---

### TODO Public builds

Build from Source
---

    docker build -t kafka .
