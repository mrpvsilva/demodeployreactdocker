#Build front-End
FROM node:10.20-alpine as build
WORKDIR /app

COPY package*.json ./

RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent

COPY . .

RUN npm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
RUN ls /usr/share/nginx/html
