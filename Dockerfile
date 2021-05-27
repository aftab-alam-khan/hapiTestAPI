FROM node:14-alpine@sha256:dc7cbd288ba1e4a67443f3ed756a042dfeba26349b873e6fd5f1b0909237bdc1

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
