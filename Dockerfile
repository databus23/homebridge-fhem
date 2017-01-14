FROM node:7.4.0

RUN apt-get update \
    && apt-get install -y python g++ libavahi-compat-libdnssd-dev \
    &&  rm -rf /var/lib/apt/lists/*

RUN npm install -g --unsafe-perm homebridge \
    && npm install -g --unsafe-perm homebridge-fhem

RUN curl -Lfo /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 \
   && chmod +x /usr/local/bin/dumb-init \
   && dumb-init -V

#COPY config.json /root/.homebridge/config.json

COPY run.sh /run.sh

ENV AVAHI=1

CMD ["dumb-init", "/run.sh"]
