FROM jetbrains/teamcity-agent

USER root

ENV NODE_VERSION=6.17.1

RUN apt-get update && \
    apt-get install wget curl ca-certificates rsync build-essential -y

RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

ENV NVM_DIR=/root/.nvm

RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}

ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

ENV OPENSSL_CONF=/dev/null

RUN npm install -g gulp