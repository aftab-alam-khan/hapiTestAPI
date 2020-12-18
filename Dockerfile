FROM node:14-alpine@sha256:bef791f512bb4c3051a1210d7fbd58206538f41eea9b966031abc8a7453308fe

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
