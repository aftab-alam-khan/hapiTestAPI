FROM node:14-alpine@sha256:3689ad4435a413342ccc352170ad0f77433b41173af7fe4c0076f0c9792642cb

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
