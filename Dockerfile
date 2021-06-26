FROM node:14-alpine@sha256:f85811929c38ded543de4294b80868d40d02000af003911179bb75f5629619e5

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
