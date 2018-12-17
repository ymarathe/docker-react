FROM node:alpine as builder

WORKDIR '/usr/frontend-app'
COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx
COPY --from=builder /usr/frontend-app/build /usr/share/nginx/html
