FROM node:8.9-alpine

WORKDIR /usr/src/app

COPY package.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
