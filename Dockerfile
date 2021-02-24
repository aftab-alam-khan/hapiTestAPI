FROM node:14-alpine@sha256:e3bcc947486dea948d1a89db56f9a22108a9e87eb6e9d3a1e8063900cbabee7e

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
