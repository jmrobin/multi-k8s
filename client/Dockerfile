# /client/Dockerfile

FROM node:10-alpine as builder

LABEL version="1.0"
LABEL maintainer="jmrobin2pi@gmail.com"
LABEL description="demo for docker"

WORKDIR /app

COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1-alpine
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 3000