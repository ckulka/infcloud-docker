ARG FROM_ARCH=amd64
ARG FROM_VARIANT=1-alpine

# Multi-stage build, see https://docs.docker.com/develop/develop-images/multistage-build/
FROM alpine AS builder

ADD https://www.inf-it.com/InfCloud_0.13.1.zip infcloud.zip
RUN apk add unzip && unzip infcloud.zip

# Final Docker image
FROM $FROM_ARCH/nginx:$FROM_VARIANT

LABEL description="InfCloud is an open source CalDAV/CardDAV web client implementation released under GNU Affero General Public License (version 3.0)."
LABEL version="0.13.1"
LABEL repository="https://github.com/ckulka/infcloud-docker"
LABEL website="https://www.inf-it.com/open-source/clients/infcloud/"

VOLUME /usr/share/nginx/html
COPY --from=builder infcloud /usr/share/nginx/infcloud
COPY files/nginx.conf /etc/nginx/conf.d/default.conf
