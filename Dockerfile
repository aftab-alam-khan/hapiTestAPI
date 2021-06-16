FROM node:14-alpine@sha256:a1e6227c8a9c3947c64f472f07eaec733e738e0ce0d53aced84e299555b24e05

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
