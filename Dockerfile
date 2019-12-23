FROM node:12.14.0-alpine3.10

USER node

ENV NODE_ENV="production" \
    NPM_CONFIG_PREFIX="/home/node/.npm-global"

RUN /usr/local/bin/npm install --global --production discord-irc@2.7.2 \
 && /usr/local/bin/npm cache clean --force

ENTRYPOINT ["/home/node/.npm-global/bin/discord-irc", "--config", "/config/discord-irc.json"]

LABEL org.opencontainers.image.authors="William Jackson <william@subtlecoolness.com>" \
      org.opencontainers.image.source="https://github.com/williamjacksn/docker-discord-irc" \
      org.opencontainers.image.version=2.7.2
