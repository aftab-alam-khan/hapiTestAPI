FROM node:14-alpine@sha256:85c91d10fe7c8b9fd52df88bd6a80e43b98c07f7f6640437a19fe55438f58ece

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
