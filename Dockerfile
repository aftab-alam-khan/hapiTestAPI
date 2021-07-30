FROM node:14-alpine@sha256:726642e5eb66aed9cd41a09bd6107954f8feb2fe4c1cd5bcf45149ab0814d577

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
