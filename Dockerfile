FROM node:14-alpine@sha256:07b040b2feb82b5384c2449630a4591138485476d20f7caf96ac8a6725056381

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
