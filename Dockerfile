FROM node:12-alpine@sha256:c29fba1f3ea0c23ca3ab59367dc644a594c8186fe28067ea4ac7e51b4a0956a1

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
