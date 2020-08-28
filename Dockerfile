FROM node:12-alpine@sha256:0b5c7eb38785da1ad4c105930faca0bc546dfcceb0464724456e277fd5e3f6e2

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
