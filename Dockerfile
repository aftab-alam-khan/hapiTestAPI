FROM node:14-alpine@sha256:c3126f821c9df618d0f734ad1babd9b45c73c1fa2b2e18ea709dff00a3283cea

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
