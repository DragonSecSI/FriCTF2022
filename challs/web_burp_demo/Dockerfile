FROM node:17.0.1-alpine3.14

WORKDIR /app

COPY package*.json .

RUN npm install

COPY . .

ARG FLAG
ENV FLAG=${FLAG}

EXPOSE 3000

USER node

CMD ["npm", "start"]
