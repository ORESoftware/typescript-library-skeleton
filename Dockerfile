FROM node:12

USER root

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm i --production

COPY . .

ENTRYPOINT ["node", "dist/main.js"]

ENV FORCE_COLOR=1

ARG NODE_ENV
ENV NODE_ENV ${NODE_ENV:-production}

# default args go here, overridden by docker run cli
CMD ["--default","arg"]


