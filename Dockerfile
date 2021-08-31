FROM node:14-alpine@sha256:76f47d2944d54aa8f80da2c7a633473f528b5e625b92d6c30afe8620d5d1869a

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
