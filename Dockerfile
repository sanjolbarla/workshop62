FROM node:8 as build 

WORKDIR /app
COPY package-json index.js ./
RUN npm install

FROM node:8-alpine

COPY --from-build /app /
EXPOSE 3000
CMD ["npm","start"]