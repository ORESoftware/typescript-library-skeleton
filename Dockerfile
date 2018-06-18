FROM node:10

RUN apt-get update && apt-get install -y sudo
RUN npm set unsafe-perm true
RUN npm install -g @oresoftware/r2g


