FROM python:alpine3.16

ARG VERSION=1.6.24

RUN apk add --update --no-cache --virtual .build-deps \
        libxslt-dev g++ &&\
    apk add --no-cache fzf libxslt && \
    YARL_NO_EXTENSIONS=1 \
    pip install --no-cache-dir \
                --no-compile \
                --no-warn-script-location \
                --disable-pip-version-check \
                animdl==${VERSION} &&\
    apk del .build-deps &&\
    find /usr/local/lib -depth \
        \( \
            \( -type d -a \( -name test -o -name tests -o -name idle_test \) \) \
            -o \
            \( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) \
        \) -exec rm -rf '{}' +;


# This hack is widely applied to avoid python printing issues in docker containers.
# See: https://github.com/Docker-Hub-frolvlad/docker-alpine-python3/pull/13
ENV PYTHONUNBUFFERED=1

ENV ANIMDL_CONFIG=/config/animdl_config.yml

VOLUME /config /downloads

WORKDIR /downloads

COPY ./animdl_config.yml /config/

ENTRYPOINT ["animdl"]
