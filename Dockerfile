FROM node:14-alpine@sha256:0c80f9449d2690eef49aad35eeb42ed9f9bbe2742cd4e9766a7be3a1aae2a310

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
