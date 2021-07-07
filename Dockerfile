FROM node:14-alpine@sha256:3f834532c950218dd369142ad5c76de8460b9d0497e2d920415d57fba9af83f9

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
