FROM node:12.19.1-alpine3.10 as build-step
WORKDIR /app
COPY . .
RUN yarn install
RUN yarn run build

FROM nginx:1.18.0-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build-step /app/build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]