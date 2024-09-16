FROM golang:1.22.0

ARG USERID=1000
ARG GROUPID=1000

RUN mkdir -p /usr/src/gocache \
    /var/www \
    && groupmod -o -g $GROUPID www-data \
    && usermod -u $USERID -g $GROUPID www-data \
    && chown -R www-data:www-data /usr/src/ \
    && chown -R www-data:www-data /var/www/ \
    && chown -R www-data:www-data /usr/src/gocache/

WORKDIR /usr/src/app

RUN go install github.com/air-verse/air@latest

COPY webproject .
ENV GOCACHE=/usr/src/gocache
RUN cd /usr/src/app && go mod tidy
RUN chown -R www-data:www-data /go/pkg/mod/cache/download/ \
    && chown -R www-data:www-data /usr/src/gocache

USER www-data:www-data