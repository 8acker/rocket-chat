FROM ubuntu:latest 
MAINTAINER Thami Bouchnafa <thami.bouchnafa@gmail.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN apt-get update
RUN apt-get install -y npm curl
RUN npm install -g n pm2 
RUN n 0.10.40

RUN curl -L https://rocket.chat/releases/latest/download -o rocket.chat.tgz
RUN tar zxvf rocket.chat.tgz 
RUN mv bundle rocket.chat
RUN cd rocket.chat/programs/server && npm i 

WORKDIR /rocket.chat

ENV ROOT_URL=https://localhost:3000/
ENV MONGO_URL=mongodb://mongo.db.lan:27017/rocketchat
ENV PORT=3000

EXPOSE 3000

ENTRYPOINT ["pm2", "start", "main.js", "--name", "Rocket Chat"]
