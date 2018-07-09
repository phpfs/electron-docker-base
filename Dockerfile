FROM ubuntu:latest

ENV WINEDLLOVERRIDE="mscoree,mshtml="
ENV WINEDEBUG="-all"

RUN  \
  dpkg --add-architecture i386 && \
  apt-get update && \
  apt-get install -y apt-utils curl gnupg2 zip && \
  (curl -sL https://deb.nodesource.com/setup_8.x | bash - &&) \
  apt-get install -y nodejs && \
  (curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -) && \
  (echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list) && \
  apt-get update && \
  apt-get install -y yarn && \
  apt-get install -y wine1.6 && \
  yarn global add electron-builder

ENTRYPOINT  \
  node -v && \
  npm -v && \
  yarn --version && \
  electron-builder --version
