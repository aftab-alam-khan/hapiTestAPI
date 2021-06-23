FROM node:14-alpine@sha256:8263de4a04679fabfdbda4e3a18de44d303ec5ba4dd3dafaf5fdc69af7164fd6

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
