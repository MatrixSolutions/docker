## What is the purpose of this repository?
This repository is for all the files/resources needed to build a docker image at Matrix. When you want to make a new docker images, commit all your stuff to this repo

## What currently exists in this repository?
- Kafka: We don't use this at all (DHM 2019). I am told that we thought about using Kafka for a bit, but didn't end up going for it.
- TeamCity Agent: We have two agents (Windows and Linux). The team talked about making a separate image for each projects that needs to be built. While this could shrink the image size, it's not worth keeping up all the different containers

Reference: [This](https://youtrack.jetbrains.com/issue/TW-61433 "TeamCity agent DNS issue") is the link to an issue opened where the DNS was not being properly set in the teamcity-agent container
