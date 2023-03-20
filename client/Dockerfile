FROM node

WORKDIR /client

COPY package.json .

RUN npm i yarn & yarn

COPY . .

EXPOSE 5173

# CMD ["yarn", "dev"]