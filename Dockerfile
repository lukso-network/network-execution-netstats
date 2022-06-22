FROM alpine:latest

ADD . /data
WORKDIR /data

# Install git, nodejs
RUN apk update && apk upgrade && apk add --no-cache git nodejs npm

# Install eth-netstats
RUN npm install
RUN npm install -g grunt-cli
RUN grunt

ENV WS_SECRET=""
EXPOSE 3000
CMD ["npm", "start"]
