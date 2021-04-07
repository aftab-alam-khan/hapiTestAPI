FROM node:14-alpine@sha256:aeb57f10e71d0d7c8e8b9821faf1793e615483bee5fc7dce90f8c82731f80827

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
