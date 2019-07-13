# /workder/Dockerfile

FROM node:10-alpine

LABEL version="1.0"
LABEL maintainer="jmrobin2pi@gmail.com"
LABEL description="demo for docker"

WORKDIR /app

COPY ./package.json .
RUN npm install

COPY . .

CMD ["npm", "run", "start"]