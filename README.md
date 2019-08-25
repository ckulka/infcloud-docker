# InfCloud

![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/ckulka/infcloud) ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/ckulka/infcloud) ![Docker Architectures](https://img.shields.io/badge/arch-amd64%20%7C%20arm32v7%20%7C%20arm64v8-informational)

This dockerfile provides a ready-to-go [InfCloud server](https://www.inf-it.com/open-source/clients/infcloud/). It was inspired and requested in [ckulka/baikal-docker#13](https://github.com/ckulka/baikal-docker/issues/13).

For more details, see [ckulka/infcloud-docker (GitHub)](https://github.com/ckulka/infcloud-docker).

## Supported tags and respective Dockerfile links

I follow the same version naming scheme as [InfCloud](https://www.inf-it.com/open-source/clients/infcloud/) themselves.

### Shared Tags

The following tags are support multiple architectures, e.g. `amd64`, `arm32v7` and `arm64v8`.

- `latest`
  - [`latest-amd64`, `latest-arm32v7`, `latest-arm64v8`](https://github.com/ckulka/infcloud-docker/blob/master/Dockerfile)

## Quick reference

- **Where to file issues**:
[https://github.com/ckulka/infcloud-docker/issues](https://github.com/ckulka/infcloud-docker/issues)
- **Supported architectures** ([more info](https://github.com/docker-library/official-images#architectures-other-than-amd64)):
[`amd64`](https://hub.docker.com/r/amd64/nginx/), [`arm32v7`](https://hub.docker.com/r/arm32v7/nginx/), [`arm64v8`](https://hub.docker.com/r/arm64v8/nginx/)
- **Image updates**:
[PRs for ckulka/baikal-docker](https://github.com/ckulka/baikal-docker/pulls)
- **Source of this description**:
[https://github.com/ckulka/baikal-docker](https://github.com/ckulka/baikal-docker)

## What is InfCloud?

From [inf-it.com/open-source/clients/infcloud](https://www.inf-it.com/open-source/clients/infcloud/):

>InfCloud is an open source CalDAV/CardDAV web client implementation released under GNU Affero General Public License (version 3.0).
>
>InfCloud is the integrated version of [CalDavZAP](https://www.inf-it.com/open-source/clients/caldavzap/) and [CardDavMATE](https://www.inf-it.com/open-source/clients/carddavmate/), and includes all features of both clients:
>
>(...)
>
>**NEW**: demo available at [https://www.inf-it.com/infcloud/](https://www.inf-it.com/infcloud/) (see the browser requirements below)
>
>(...)
>
>Tested with the following CalDAV servers: [DAViCal](http://www.davical.org/), [OS X server](http://www.apple.com/macosx/server/), [Cyrus IMAP CalDAV (beta)](http://cyrusimap.web.cmu.edu/mediawiki/index.php/Latest_Updates), [SabreDAV](http://code.google.com/p/sabredav/), [Baïkal](http://baikal-server.com/), [Radicale (>=0.8)](http://radicale.org/), [openCRX](http://www.opencrx.org/) and [Oracle Communications Calendar Server](http://www.oracle.com/us/industries/communications/oracle-communications-suite-066166.html)

## How to use this image

This image serves the static content with [nginx](http://nginx.org/) and renders the PHP files with [PHP-FPM](https://hub.docker.com/_/php#phpversion-fpm).

This repository contains a Docker Compose example in [examples/docker-compose.yaml](https://github.com/ckulka/infcloud-docker/blob/master/examples/docker-compose.yaml) to give an easy example:

```bash
docker-compose up
```

If you only need the static files, you can also just run the Nginx container:

```bash
docker run --rm -it -p 80:80 ckulka/infcloud
```

Then you can hit [http://localhost](http://localhost) or [http://host-ip](http://host-ip) in your browser and use InfCloud.

The last step is to configure InfCloud; for setup instructions see the official [readme.txt](https://www.inf-it.com/infcloud/readme.txt) and comments in InfCloud's [config.js](https://www.inf-it.com/infcloud/config.js.txt).
