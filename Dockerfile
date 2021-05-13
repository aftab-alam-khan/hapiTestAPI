FROM node:14-alpine@sha256:feb2573821d7580419e43370fdb19bf6bb47355a834c87d589072b3cc63f67fc

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
