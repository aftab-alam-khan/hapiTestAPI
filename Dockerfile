FROM node:14-alpine@sha256:8bd6100693a93cca2a3c3b1d8dfbcb7434d4b1731c625204966a87ea2efb36bc

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
