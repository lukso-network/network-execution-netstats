L16 Network Stats
============
[![Build Status][travis-image]][travis-url] [![dependency status][dep-image]][dep-url]

This is a visual interface for tracking L16 network status. It uses WebSockets to receive stats from running nodes and output them through an angular interface. It is the front-end implementation for [eth-net-intelligence-api](https://github.com/cubedro/eth-net-intelligence-api).

![Screenshot](https://raw.githubusercontent.com/cubedro/eth-netstats/master/src/images/screenshot.jpg?v=0.0.6 "Screenshot")

##Build the Docker image

To build the docker image from Linux
```bash
sudo docker build -t europe-docker.pkg.dev/lks-lz-artifacts/docker-ethstats/eth1stats:<versionNumber> .
```

To build the docker image from MacOS M1 (the platform flag must be provided otherwise the image is build in ARM64 instaed of AMD64)
```bash
sudo docker build -t europe-docker.pkg.dev/lks-lz-artifacts/docker-ethstats/eth1stats:<versionNumber> --platform linux/amd64 .
```

##Push the Docker image

```bash
sudo docker push europe-docker.pkg.dev/lks-lz-artifacts/docker-ethstats/eth1stats:<versionNumber>
```

##Example of docker-compsoe

```yaml
version: "3.4"
services:
  eth1-stats:
    image: europe-docker.pkg.dev/lks-lz-artifacts/docker-ethstats/eth1stats:v0.0.2
      #image: eu.gcr.io/l15-testnet/ethstats@sha256:8da5f8e261d8c32cdf181facfc9322da3d974e07d2a08b8283f1bf82325dde64
    container_name: lukso-ethstats
    restart: always
    environment:
      WS_SECRET: ""
    ports:
      - 80:3000
```

##Run

```bash
sudo docker-compose up -d
```

see the interface at http://localhost:3000

[travis-image]: https://travis-ci.org/cubedro/eth-netstats.svg
[travis-url]: https://travis-ci.org/cubedro/eth-netstats
[dep-image]: https://david-dm.org/cubedro/eth-netstats.svg
[dep-url]: https://david-dm.org/cubedro/eth-netstats
