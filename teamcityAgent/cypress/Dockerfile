FROM jetbrains/teamcity-agent

# cypress/base ######################################################

RUN apt-get update && \
  apt-get install -y \
    apt-utils \
    libgtk2.0-0 \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    nodejs \
    npm \
    xvfb

# versions of local tools
RUN node -v
# NPM version should already be pretty new (> 6.4.0)
RUN npm -v
#####################################################################


# cypress/browser ###################################################
# USER root

# RUN node --version
# RUN echo "force new chrome here"

# install Chromebrowser
# RUN \
#   wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
#   echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
#   apt-get update && \
#   apt-get install -y dbus-x11 google-chrome-stable && \
#   rm -rf /var/lib/apt/lists/*

# # "fake" dbus address to prevent errors
# # https://github.com/SeleniumHQ/docker-selenium/issues/87
# ENV DBUS_SESSION_BUS_ADDRESS=/dev/null

# # Add zip utility - it comes in very handy
# RUN apt-get update && apt-get install -y zip

# # versions of local tools
# RUN node -v
# RUN npm -v
# RUN yarn -v
# RUN google-chrome --version
# RUN zip --version
# RUN git --version

# # a few environment variables to make NPM installs easier
# # good colors for most applications
# ENV TERM xterm
# # avoid million NPM install messages
# ENV npm_config_loglevel warn
# # allow installing when the main user is root
# ENV npm_config_unsafe_perm true
#####################################################################