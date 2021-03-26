FROM node:14-alpine@sha256:963724bb905330e73a72511e1ca2ae337e49ccb7636875777cd11324430c690e

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
