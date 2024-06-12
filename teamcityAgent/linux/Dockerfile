FROM jetbrains/teamcity-agent:2024.03.2-linux
USER root

ENV NODE_VERSION=6.17.1

RUN apt-get update && \
    apt-get install wget curl ca-certificates rsync build-essential -y

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

RUN apt-get install -f -y && \
    apt install ./google-chrome-stable_current_amd64.deb -y && \
    rm -rf /var/lib/apt/lists/*

ENV CHROME_BIN="/usr/bin/google-chrome-stable"

RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

ENV NVM_DIR=/root/.nvm

RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}

ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

ENV OPENSSL_CONF=/dev/null

RUN npm install -g gulp@3.9.1

