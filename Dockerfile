FROM golang:1.21-bullseye AS builder

WORKDIR /app

COPY . ./

RUN apt-get update -y && apt-get install -y hugo

RUN hugo

FROM nginx:1.23-alpine

RUN rm -r /usr/share/nginx/html

COPY --from=builder /app/public /usr/share/nginx/html
