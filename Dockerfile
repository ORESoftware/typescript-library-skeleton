FROM node:20-alpine

USER root

WORKDIR /app

# TODO: if you have a postinstall script, you may need to copy that here too
COPY assets assets
COPY package.json .
COPY package-lock.json .

RUN npm i --production

COPY . .

ENTRYPOINT ["./entrypoint.sh"]

ENV FORCE_COLOR=1

ARG NODE_ENV
ENV NODE_ENV ${NODE_ENV:-production}

# default args go here, overridden by docker run cli
CMD ["node", "dist/main.js", "--default", "arg"]

