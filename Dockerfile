FROM node:14-alpine@sha256:cc1e73c9e7ce62c0e1c37db382d1edf50e7332f205c46ec36cfcca1efb6defed

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
