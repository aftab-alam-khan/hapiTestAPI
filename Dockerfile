FROM node:14-alpine@sha256:dc9641311155f990b713df6ab2751c9dc487bd64dd66fb3a25dce673fd4167cc

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
