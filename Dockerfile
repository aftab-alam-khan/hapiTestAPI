FROM node:12-alpine@sha256:877daace788d0118a07230393db0c3bc2ba92327f645da141a46b497bd96bb22

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
