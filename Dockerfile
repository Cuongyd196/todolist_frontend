FROM node:12.19.1-alpine3.10 as build-step
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "start"]