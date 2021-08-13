FROM node:14-alpine@sha256:ce7f5c604dba6cb15a86c8bea1d35b657798bb2e65e33b6619d610189a74b936

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
