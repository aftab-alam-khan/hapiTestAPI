FROM node:14-alpine@sha256:d5208361b8346796c6b9c5bebaa5894c7551b76057d581ba57f9bcdecb4c4d4f

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
