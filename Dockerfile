FROM node:14-alpine@sha256:ec68bdc1f61ed11169c319fe71348581a5d474cb1fd8c6a0f734e2698010fcc3

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
