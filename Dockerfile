FROM node:7.9.0-alpine
RUN apk add --no-cache curl
RUN curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version v0.23.4
COPY package.json package.json
COPY yarn.lock yarn.lock
COPY .eslintrc.json /etc/eslint/.eslintrc.json
RUN yarn global install
