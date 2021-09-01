FROM node:14-alpine@sha256:cdc1f725e56aae1266069bfda5a97a71c9f4d0e5e2675c6b80a4cd37e8fefba4

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
