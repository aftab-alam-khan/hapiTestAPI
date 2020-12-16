FROM node:14-alpine@sha256:80fa6b61adccba7ee79d47194bea3afa6bab31980c559ace4a7f2f3a7c50a05c

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
