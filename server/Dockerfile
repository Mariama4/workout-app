FROM node

WORKDIR /server

COPY package.json .

RUN npm i yarn & yarn

COPY . .

EXPOSE 5050

# CMD ["node", "server.js"]