ARG FROM_VARIANT=1-alpine

# Multi-stage build, see https://docs.docker.com/develop/develop-images/multistage-build/
FROM alpine AS builder

RUN apk add \
  unzip \
  curl

RUN infcloud_url='https://www.inf-it.com/InfCloud_0.13.1.zip' \
    && infcloud_hash='9fa95edd2dcc2b864a10b503ab9220895ea28d4c5541ab02117de1511d5464d4' \
    && curl -SL --output infcloud.zip "${infcloud_url}" \
    && echo "${infcloud_hash}  infcloud.zip" | sha256sum -c - \
    && unzip infcloud.zip \
    && rm infcloud.zip

# Final Docker image
FROM nginx:$FROM_VARIANT

LABEL description="InfCloud is an open source CalDAV/CardDAV web client implementation released under GNU Affero General Public License (version 3.0)."
LABEL version="0.13.1"
LABEL repository="https://github.com/ckulka/infcloud-docker"
LABEL website="https://www.inf-it.com/open-source/clients/infcloud/"

COPY --from=builder infcloud /usr/share/nginx/infcloud
COPY files/nginx.conf /etc/nginx/conf.d/default.conf
