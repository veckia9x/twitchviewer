FROM node:13.12.0-alpine3.10
LABEL maintainer="Veckia <veckiadrop@gmail.com>"
RUN apk add --no-cache chromium nss freetype freetype-dev harfbuzz ca-certificates ttf-freefont git \
&& mkdir -p /usr/src/app && cd /usr/src/app/ \
&& git clone https://github.com/veckia9x/twitchviewer \
&& mv twitchviewer/* . \
&& rm -rf twitchviewer/ \
&& apk del git \
&& rm -f /sbin/apk \
&& rm -rf /etc/apk \
&& rm -rf /lib/apk \
&& rm -rf /usr/share/apk \
&& rm -rf /var/lib/apk
WORKDIR /usr/src/app
RUN npm install
CMD ["npm","start"]
