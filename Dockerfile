FROM node:10

RUN apt-get update && apt-get install -y sudo
RUN npm set unsafe-perm true
RUN npm install -g @oresoftware/r2g

#RUN echo $(whoami)
#RUN mkdir -p /root/repo
#WORKDIR /root/repo
#COPY . .
#
#RUN r2g run



