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

Run
---

```bash
# TODO: Add run command once public
```

```bash
# TODO: Add topic creation command once public
```

```bash
# TODO: Add producer command once public
```

```bash
# TODO: Add consumer command once public
```

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
