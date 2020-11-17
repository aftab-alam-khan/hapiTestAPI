FROM node:14-alpine@sha256:05a2f563ff66492dbe3c82cb482d6c1bbaecefcac4d42bd3744c7693028c9e44

WORKDIR /usr/src/app

COPY package.json package-lock.json .

RUN npm install --quiet

COPY . .

EXPOSE 3000

CMD npm start
