FROM node:14-alpine@sha256:230a61aff2a8ba4e291b3b0eeac203cca6e25b3aabd4ddbd969bb71125fe7cbc

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
