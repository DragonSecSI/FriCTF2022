FROM node:17.0.1-alpine3.14 AS production

WORKDIR /app

COPY ./package*.json .

RUN npm install

COPY ./* .

ARG ENV_PASSWORD
ARG FLAG
ENV FLAG=${FLAG}

RUN echo "PASSWORD=${ENV_PASSWORD}" >> .env

EXPOSE 3000

USER node

CMD ["npm", "start"]