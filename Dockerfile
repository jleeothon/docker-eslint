FROM node:7.9.0-alpine

RUN touch $HOME/.profile
RUN \
apk add --no-cache --virtual .yarn-deps curl gnupg tar && \
curl -o- -L https://yarnpkg.com/install.sh | sh -s -- --version 0.23.4 && \
apk del .yarn-deps

COPY package.json package.json
COPY yarn.lock yarn.lock
COPY .eslintrc.json /etc/eslint/.eslintrc.json
RUN yarn install -g
