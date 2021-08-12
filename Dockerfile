FROM node:14-alpine@sha256:80b5b0066b717e342467f0784c95d5d794fdd8a73eb63a9b5d82d0727feac39b

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
