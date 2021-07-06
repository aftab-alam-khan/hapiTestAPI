FROM node:14-alpine@sha256:71a9ab5b02d8ddbcb56dab75d6d58720a2bb7536b4c72688b6443a22f2718676

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
