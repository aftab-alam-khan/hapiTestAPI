FROM node:14-alpine@sha256:5edad160011cc8cfb69d990e9ae1cb2681c0f280178241d58eba05b5bfc34047

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
