FROM python:alpine

RUN apk add --no-cache --virtual .build-deps \
    ca-certificates gcc mariadb-dev linux-headers musl-dev \
    libffi-dev jpeg-dev zlib-dev libwebp-dev

ENV PYTHONUNBUFFERED=1

WORKDIR /code/

COPY requirements.txt /code/

RUN pip install -r requirements.txt

RUN addgroup -S web -g 1000 && adduser -u 1000 -G web -D web

USER web
