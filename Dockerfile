FROM node:0.12

RUN mkdir /app

COPY server.js /app/server.js

WORKDIR /app

CMD node server.js
