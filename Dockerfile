FROM node:14-alpine@sha256:d1a10d5865ab05430703f75e5a2a6897c1106a6f264d0317fbd785e24d4e8b25

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
