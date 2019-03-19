FROM alpine:3.9

LABEL maintainer="felipefrancisco.cwb@gmail.com"

# install
RUN apk add --update --no-cache wget \
    && wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -O ngrok.zip \
    && unzip -o ngrok.zip -d /usr/bin \
    && rm -f ngrok.zip \
    && apk del wget

# non-root user
RUN adduser -h /home/ngrok -D -u 6737 ngrok

ENV USER ngrok
USER ngrok

WORKDIR /home/ngrok
COPY ./ngrok.yml /home/ngrok/.ngrok2/ngrok.yml

EXPOSE 4040

ENTRYPOINT ngrok

