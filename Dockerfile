FROM node:14-alpine@sha256:3354c7dfe324bbe3e72dfc9a124c4c86ebceab36ee403333c70e91b37510be1d

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
