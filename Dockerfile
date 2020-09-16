FROM node:12-alpine@sha256:f667be05181f5bc13cc8ff1dac8b0ffb9198e98f3d6562342ef44255087a584c

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
